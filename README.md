من از یک گیت لب  لوکالی که با کانتینر داکر رانش کردم استفاده کردم و گیت لب رانر ها که (2 عدد) بودند رو روی سرور اصلی نصب کردم 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
برای pull کردن این ریپوزیتوری اگر چنانچه مثل من از یک گیت لب لوکالی استفاده میکنید باید اول اون رو روی سرورتون clone کنید تا کل دایرکتوری رو داشته باشید و بعد ان را به سرور گیت لبتون انتقال بدین
با دستور git clone https://github.com/kamixof/nadin-task.git  میتونید کلون کنید 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
قبل از انجام پایپ لاین ها باید توجه داشته باشید که ادرس سرورتون رو به انچیزی که هست تغییر بدین در اینجا برای من 192.168.83.7 بود میتونید هر جا این ادرس رو دیدید ادرس سرور خودتون رو جاگذاری کنید
حالا به بخش CI/CD  برید و در قسمت جابها مراحلی که باید طی کنید را میبیند  البته دو مرحله ابندایی  build  و  test  به صورت خودکار هستند بقیه مراحل باید بر روی کلید ساخته شده انها کلیک شود
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
بعد از اتمام مراحل این کانتینرها رو باید داشته باشید 
<img width="1682" height="303" alt="Screenshot 2025-08-08 091105" src="https://github.com/user-attachments/assets/2cbdaeb3-5a52-441c-94f2-88d379c8cff9" />
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
در زیر اسکرین شات از لاگهای کانتینر ها رو میذارم 
docker logs task_web-service_1

[2025-08-08 04:53:03 +0000] [1] [INFO] Starting gunicorn 20.1.0
[2025-08-08 04:53:03 +0000] [1] [INFO] Listening at: http://0.0.0.0:5000 (1)
[2025-08-08 04:53:03 +0000] [1] [INFO] Using worker: sync
[2025-08-08 04:53:03 +0000] [8] [INFO] Booting worker with pid: 8
[2025-08-08 04:57:27 +0000] [1] [CRITICAL] WORKER TIMEOUT (pid:8)
[2025-08-08 04:57:27 +0000] [8] [INFO] Worker exiting (pid: 8)
[2025-08-08 04:57:27 +0000] [25] [INFO] Booting worker with pid: 25
[2025-08-08 05:00:29 +0000] [1] [CRITICAL] WORKER TIMEOUT (pid:25)
[2025-08-08 05:00:29 +0000] [25] [INFO] Worker exiting (pid: 25)
[2025-08-08 05:00:29 +0000] [39] [INFO] Booting worker with pid: 39
[2025-08-08 05:01:51 +0000] [1] [CRITICAL] WORKER TIMEOUT (pid:39)
[2025-08-08 05:01:51 +0000] [39] [INFO] Worker exiting (pid: 39)
[2025-08-08 05:01:51 +0000] [47] [INFO] Booting worker with pid: 47
[2025-08-08 05:49:44 +0000] [1] [CRITICAL] WORKER TIMEOUT (pid:47)
[2025-08-08 05:49:44 +0000] [47] [INFO] Worker exiting (pid: 47)
[2025-08-08 05:49:44 +0000] [240] [INFO] Booting worker with pid: 240
[2025-08-08 05:50:35 +0000] [1] [CRITICAL] WORKER TIMEOUT (pid:240)
[2025-08-08 05:50:35 +0000] [240] [INFO] Worker exiting (pid: 240)
[2025-08-08 05:50:35 +0000] [246] [INFO] Booting worker with pid: 246
[2025-08-08 06:33:07 +0000] [1] [CRITICAL] WORKER TIMEOUT (pid:246)
[2025-08-08 06:33:07 +0000] [246] [INFO] Worker exiting (pid: 246)
[2025-08-08 06:33:07 +0000] [350] [INFO] Booting worker with pid: 350
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 docker logs task_alertmanager_1
 
ts=2025-08-08T04:53:41.636Z caller=main.go:181 level=info msg="Starting Alertmanager" version="(version=0.27.0, branch=HEAD, revision=0aa3c2aad14cff039931923ab16b26b7481783b5)"
ts=2025-08-08T04:53:41.636Z caller=main.go:182 level=info build_context="(go=go1.21.7, platform=linux/amd64, user=root@22cd11f671e9, date=20240228-11:51:20, tags=netgo)"
ts=2025-08-08T04:53:41.637Z caller=cluster.go:186 level=info component=cluster msg="setting advertise address explicitly" addr=192.168.16.3 port=9094
ts=2025-08-08T04:53:41.639Z caller=cluster.go:683 level=info component=cluster msg="Waiting for gossip to settle..." interval=2s
ts=2025-08-08T04:53:41.693Z caller=coordinator.go:113 level=info component=configuration msg="Loading configuration file" file=/etc/alertmanager/alertmanager.yml
ts=2025-08-08T04:53:41.694Z caller=coordinator.go:126 level=info component=configuration msg="Completed loading of configuration file" file=/etc/alertmanager/alertmanager.yml
ts=2025-08-08T04:53:41.698Z caller=tls_config.go:313 level=info msg="Listening on" address=[::]:9093
ts=2025-08-08T04:53:41.699Z caller=tls_config.go:316 level=info msg="TLS is disabled." http2=false address=[::]:9093
ts=2025-08-08T04:53:43.640Z caller=cluster.go:708 level=info component=cluster msg="gossip not settled" polls=0 before=0 now=1 elapsed=2.000882659s
ts=2025-08-08T04:53:51.644Z caller=cluster.go:700 level=info component=cluster msg="gossip settled; proceeding" elapsed=10.004238663s
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
