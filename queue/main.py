from queues import task_without_timeout, task_with_timeout

job = task_with_timeout(param="value1", client_id="1111")
job = task_with_timeout(param="value2", client_id="1111")
job = task_with_timeout(param="value3", client_id="1111")
job = task_with_timeout(param="value4", client_id="1111")

job = task_without_timeout(param="value1", client_id="2222")
job = task_without_timeout(param="value2", client_id="2222")
job = task_without_timeout(param="value3", client_id="2222")
job = task_without_timeout(param="value4", client_id="2222")