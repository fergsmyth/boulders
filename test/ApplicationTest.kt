package org.fergs

import io.ktor.http.*
import kotlin.test.*
import io.ktor.server.testing.*
import org.fergs.kotlin.module

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
