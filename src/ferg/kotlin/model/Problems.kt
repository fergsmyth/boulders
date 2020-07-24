package ferg.kotlin.model

import org.jetbrains.exposed.sql.*
import ferg.kotlin.model.Crags
import ferg.kotlin.model.Grade

object Problems : Table() {
    val id = integer("id").autoIncrement().primaryKey()
    val name = varchar("name", 128)
    val grade = (integer("grade_id") references Grade.id).nullable()
    val sender = varchar("sender", 128)
    val send_date = date("date")
    val cragId = (integer("crag_id") references Crags.id).nullable()
}