
Aquí te presento una posible diseño de base de datos relacional para una academia de artes marciales:

Tablas

1. Instructors (Profesores)
  •  ID  (PK): Identificador único del instructor
  •  Name : Nombre completo del instructor
  •  Email : Correo electrónico del instructor
  •  Phone : Número de teléfono del instructor
2. Students (Estudiantes)
  •  ID  (PK): Identificador único del estudiante
  •  Name : Nombre completo del estudiante
  •  Email : Correo electrónico del estudiante
  •  Phone : Número de teléfono del estudiante
  •  Address : Dirección del estudiante
3. Courses (Cursos)
  •  ID  (PK): Identificador único del curso
  •  Name : Nombre del curso (e.g., Karate, Taekwondo, etc.)
  •  Description : Descripción breve del curso
  •  Duration : Duración del curso en minutos
4. Schedules (Horarios)
  •  ID  (PK): Identificador único del horario
  •  Course_ID  (FK): Identificador del curso relacionado
  •  Day : Día de la semana (e.g., Lunes, Martes, etc.)
  •  Time : Hora de inicio y fin del horario (e.g., 18:00-19:30)
5. Locations (Sedes)
  •  ID  (PK): Identificador único de la sede
  •  Address : Dirección de la sede
6. Attendance (Asistencias)
  •  ID  (PK): Identificador único de la asistencia
  •  Student_ID  (FK): Identificador del estudiante relacionado
  •  Schedule_ID  (FK): Identificador del horario relacionado
  •  Date : Fecha de la asistencia
7. Payments (Pagos)
  •  ID  (PK): Identificador único del pago
  •  Student_ID  (FK): Identificador del estudiante relacionado
  •  Amount : Monto pagado por el estudiante
  •  Date : Fecha de pago
8. Ranks (Rangos)
  •  ID  (PK): Identificador único del rango
  •  Name : Nombre del rango (e.g., Beginner, Intermediate, Advanced)
9. Student_Ranks (Rangos alcanzados por estudiantes)
  •  ID  (PK): Identificador único de la relación entre estudiante y rango
  •  Student_ID  (FK): Identificador del estudiante relacionado
  •  Rank_ID  (FK): Identificador del rango relacionado
  •  Achievement_Date : Fecha en que el estudiante alcanzó el rango


Relaciones

• Un instructor puede dictar varios cursos (one-to-many: Instructors → Courses)
• Un curso puede tener varios horarios (one-to-many: Courses → Schedules)
• Una sede puede tener varios horarios (one-to-many: Locations → Schedules)
• Un estudiante puede asistir a varios horarios (many-to-many: Students → Attendance → Schedules)
• Un pago está relacionado con un estudiante y una fecha (many-to-one: Payments → Students)
• Un rango puede ser alcanzado por varios estudiantes (one-to-many: Ranks → Student_Ranks)

Índices

• Crear índices en las columnas  Name  de Instructors, Students y Courses para facilitar la búsqueda
rápida.
• Crear índices en las columnas  Schedule_ID  de Attendance y  Course_ID  de Schedules para optimizar
la consulta de asistencias y horarios.

Consideraciones

• La tabla  Attendance  puede crecer rápidamente, por lo que se recomienda crear particiones por
fecha o rango de fechas para mejorar el rendimiento.
• Se puede agregar una tabla adicional para almacenar información adicional sobre los pagos, como la
forma de pago o el monto total pagado por un estudiante.
• Es importante considerar la seguridad y la autenticación para evitar acceso no autorizado a la base
de datos.
