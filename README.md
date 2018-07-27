# helper_scripts

Створено для репозиторіїв з пакетним менеджером apt (Debian і заснованих на них (Ubuntu, Linux Mint...)).
Деякі скрипти потребуюсть запуску через sudo.

* (lamp.sh) Встановлення php, mysql, apache.
* (dbcheck.sh) Перевіряє чи створена база даних user_data якщо ні, то створює цю базу даних із таблицями users, data (заповнює їх полем id).
* (backup.sh) Здійснює backup бази даних і файлів/директорій в середині директорії /var/www. Бекапи архівуються (tar, метод gzip). При запуску перевіряє чи є у директорії, в яку складаються бекапи, старші за 2 тижні. Скрипт прийнмає на вхід дані про те, що потрібно бекапити.
* (httpd.sh) Перевіряє чи запущений сервіс httpd (apache2). Якщо не запущений то здійсює спробу запуску.
* (install-java7-maven-tomcat.sh) Встановлює java 7, maven, tomcat і конфігурує їх. Після встановлення потрібно перезапустити сисетму. Запускати використовуючи sudo і присвоїти право на запуск (chmod +x install-java7-maven-tomcat.sh) . На початку скрипта є можливість змінити змінні і вибрати свій пароль і назву користувача для tomcat. Коректність роботи провірена на centos7-min.
* (install-mysqlForTomcat.sh) Встановлює MySQL і підготовує для праці з tomcat для запуску OMS. На початку скрипта є можливість змінити змінні для налаштування своїх назв баз даних, ім'я користувача і паролю. Запускати використовуючи sudo і присвоїти право на запуск (chmod +x install-mysqlForTomcat.sh).


test34
