package org.fergs

import io.ktor.http.*
import kotlin.test.*
import io.ktor.server.testing.*
import ferg.kotlin.module

class ApplicationTest {
    @Test
    fun testRoot() {
        withTestApplication({ module(testing = true) }) {
            handleRequest(HttpMethod.Get, "/").apply {
                assertEquals(HttpStatusCode.OK, response.status())
            }
        }
    }
}
