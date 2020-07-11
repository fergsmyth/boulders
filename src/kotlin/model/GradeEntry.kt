package org.fergs.model

import org.jetbrains.exposed.sql.Table

object Grade: Table() {
    val id = integer("id").autoIncrement().primaryKey()
    val font =  varchar("name", 128)
    val hueco =  varchar("name", 128)
}