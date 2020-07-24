package ferg.kotlin.model

import org.jetbrains.exposed.sql.Table
import ferg.kotlin.model.Problems.autoIncrement
import ferg.kotlin.model.Problems.primaryKey

object Session : Table() {
    val id = Problems.integer("id").autoIncrement().primaryKey()
}