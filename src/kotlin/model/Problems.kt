package org.fergs.model

import org.jetbrains.exposed.sql.*

object Problems : Table() {
    val id = integer("id").autoIncrement().primaryKey()
    val name = varchar("name", 128)
    val grade = (integer("grade_id") references Grade.id).nullable()
    val sender = varchar("sender", 128)
    val send_date = date("date")
    val cragId = (integer("crag_id") references Crags.id).nullable()
}