import redis
from rq import Queue
from rq.job import Dependency
from redis.exceptions import WatchError
from functools import wraps
from tasks import task_with_timeout, task_without_timeout

redis_con = redis.StrictRedis(host='localhost', port=6379, db=0)
queue = Queue(connection=redis_con)

# Constants
class _const:
    JOB_KEY_ID = 'JOB_KEY:{}'
    JOB_NAME_ID = 'JOB_NAME:{}:{}'


def enqueue_job(func):
    @wraps(func)
    def inner(*args, **kwargs):
        client_id = kwargs.get("client_id", None)
        assert client_id is not None, "client_id is required"
        
        with redis_con.pipeline() as p:
            while True:
                try:
                    p.watch(_const.JOB_KEY_ID.format(client_id))
                    current_id = p.get(_const.JOB_KEY_ID.format(client_id))
                    last_id = int(current_id) if current_id is not None else 0
                    current_id = (int(current_id) + 1) if current_id is not None else 0
                    
                    p.multi()
                    p.set(_const.JOB_KEY_ID.format(client_id), current_id)

                    p.execute()

                    dependency = Dependency(
                        jobs=_const.JOB_NAME_ID.format(client_id, last_id),
                        allow_failure=True
                    )
                    return queue.enqueue(
                        func, *args, **kwargs,
                        depends_on=dependency,
                        job_id=_const.JOB_NAME_ID.format(client_id, current_id),
                    )
                except WatchError:
                    continue
    return inner

task_without_timeout = enqueue_job(task_without_timeout)
task_with_timeout = enqueue_job(task_with_timeout)