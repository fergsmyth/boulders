package ferg.kotlin.model

import org.jetbrains.exposed.sql.Table

object Crags : Table() {
    val id = integer("id").autoIncrement().primaryKey()
    val name = varchar("name", 128)
    val area = varchar("area", 128)
    val county = varchar("county", 128)
    val description = varchar("description", 128)
}