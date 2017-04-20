# ProjectJavaDM
Empezar proyecto

--------------------------------------------------------------------
//    Periocidad del Scheduled

//	  ┌──────────── second (0)
//	  │ ┌────────── minute (0 - 59)
//	  │ │ ┌──────── hour (0 - 23)
//	  │ │ │ ┌────── day of month (1 - 31)
//	  │ │ │ │ ┌──── month (1 - 12)
//	  │ │ │ │ │ ┌── day of week (0 - 6 => Sunday - Saturday, or
//	  │ │ │ │ │ │                1 - 7 => Monday - Sunday)
//	  ↓ ↓ ↓ ↓ ↓ ↓
//	  * * * * * * command to be executed
//    @Scheduled(cron=" 0 0 8? * Mon", zone="Europe/Madrid")


====================================================================
DAY
0 - Domingo
1 - Lunes
2 - Martes
3 - Miercoles
4 - Jueves
5 - Viernes
6 - Sabado
====================================================================
0 0 8 * * * 
====================================================================
Mirar zona horaria de todo el mundo
https://docs.oracle.com/cd/B13866_04/webconf.904/b10877/timezone.htm
--------------------------------------------------------------------

********************************************************************
Pasos a seguir para el despliegue de la Aplicación
********************************************************************

Manuales para la configuración e instalación de MySQL, Entorno de desarrollo, etc...

1. 01 Manual Configuración MySQL
2. 02 Manual Configuración Entorno Desarrollo