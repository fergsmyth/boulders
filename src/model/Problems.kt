package org.fergs.model

import org.jetbrains.exposed.sql.*

object Problems : Table() {
    val id = integer("id").autoIncrement().primaryKey()
    val name = varchar("name", 128)
    val grade = varchar("name", 128)
    val sender = varchar("name", 128)
    val send_date = date("name")
    val cragId = (integer("crag_id") references Crags.id).nullable()
}