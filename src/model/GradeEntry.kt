package org.fergs.model

import org.jetbrains.exposed.sql.Table

object GradeEntry: Table() {
    val id = integer("id").autoIncrement().primaryKey()
    val font =  varchar("name", 128)
    val hueco =  varchar("name", 128)
}