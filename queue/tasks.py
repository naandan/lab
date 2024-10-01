import time

def task_with_timeout(param, client_id):
    time.sleep(10)
    print(f"Executing task with param={param}, client_id={client_id}")
    return "Selesai"

def task_without_timeout(param, client_id):
    print(f"Enqueuing task with param={param}, client_id={client_id}")
    return "Selesai"
