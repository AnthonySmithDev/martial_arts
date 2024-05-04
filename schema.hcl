table "Attendance" {
  schema = schema.example
  column "ID" {
    null           = false
    type           = int
    auto_increment = true
  }
  column "Student_ID" {
    null = true
    type = int
  }
  column "Schedule_ID" {
    null = true
    type = int
  }
  column "Date" {
    null = false
    type = date
  }
  primary_key {
    columns = [column.ID]
  }
  foreign_key "Attendance_ibfk_1" {
    columns     = [column.Student_ID]
    ref_columns = [table.Students.column.ID]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  foreign_key "Attendance_ibfk_2" {
    columns     = [column.Schedule_ID]
    ref_columns = [table.Schedules.column.ID]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  index "Schedule_ID" {
    columns = [column.Schedule_ID]
  }
  index "Student_ID" {
    columns = [column.Student_ID]
  }
}
table "Courses" {
  schema = schema.example
  column "ID" {
    null           = false
    type           = int
    auto_increment = true
  }
  column "Name" {
    null = false
    type = varchar(100)
  }
  column "Description" {
    null = true
    type = text
  }
  column "Duration" {
    null = false
    type = int
  }
  primary_key {
    columns = [column.ID]
  }
}
table "Instructors" {
  schema = schema.example
  column "ID" {
    null           = false
    type           = int
    auto_increment = true
  }
  column "Name" {
    null = false
    type = varchar(100)
  }
  column "Email" {
    null = true
    type = varchar(100)
  }
  column "Phone" {
    null = true
    type = varchar(20)
  }
  primary_key {
    columns = [column.ID]
  }
}
table "Locations" {
  schema = schema.example
  column "ID" {
    null           = false
    type           = int
    auto_increment = true
  }
  column "Address" {
    null = false
    type = text
  }
  primary_key {
    columns = [column.ID]
  }
}
table "Payments" {
  schema = schema.example
  column "ID" {
    null           = false
    type           = int
    auto_increment = true
  }
  column "Student_ID" {
    null = true
    type = int
  }
  column "Amount" {
    null     = false
    type     = decimal(10,2)
    unsigned = false
  }
  column "Date" {
    null = false
    type = date
  }
  primary_key {
    columns = [column.ID]
  }
  foreign_key "Payments_ibfk_1" {
    columns     = [column.Student_ID]
    ref_columns = [table.Students.column.ID]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  index "Student_ID" {
    columns = [column.Student_ID]
  }
}
table "Ranks" {
  schema = schema.example
  column "ID" {
    null           = false
    type           = int
    auto_increment = true
  }
  column "Name" {
    null = false
    type = varchar(100)
  }
  primary_key {
    columns = [column.ID]
  }
}
table "Schedules" {
  schema = schema.example
  column "ID" {
    null           = false
    type           = int
    auto_increment = true
  }
  column "Course_ID" {
    null = true
    type = int
  }
  column "Day" {
    null = true
    type = varchar(10)
  }
  column "Time" {
    null = false
    type = time
  }
  primary_key {
    columns = [column.ID]
  }
  foreign_key "Schedules_ibfk_1" {
    columns     = [column.Course_ID]
    ref_columns = [table.Courses.column.ID]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  index "Course_ID" {
    columns = [column.Course_ID]
  }
}
table "Student_Ranks" {
  schema = schema.example
  column "ID" {
    null           = false
    type           = int
    auto_increment = true
  }
  column "Student_ID" {
    null = true
    type = int
  }
  column "Rank_ID" {
    null = true
    type = int
  }
  column "Achievement_Date" {
    null = false
    type = date
  }
  primary_key {
    columns = [column.ID]
  }
  foreign_key "Student_Ranks_ibfk_1" {
    columns     = [column.Student_ID]
    ref_columns = [table.Students.column.ID]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  foreign_key "Student_Ranks_ibfk_2" {
    columns     = [column.Rank_ID]
    ref_columns = [table.Ranks.column.ID]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  index "Rank_ID" {
    columns = [column.Rank_ID]
  }
  index "Student_ID" {
    columns = [column.Student_ID]
  }
}
table "Students" {
  schema = schema.example
  column "ID" {
    null           = false
    type           = int
    auto_increment = true
  }
  column "Name" {
    null = false
    type = varchar(100)
  }
  column "Email" {
    null = true
    type = varchar(100)
  }
  column "Phone" {
    null = true
    type = varchar(20)
  }
  column "Address" {
    null = true
    type = text
  }
  primary_key {
    columns = [column.ID]
  }
}
schema "example" {
  charset = "utf8mb4"
  collate = "utf8mb4_0900_ai_ci"
}
