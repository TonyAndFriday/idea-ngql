package com.tony.nebulahighlight.language

import com.intellij.lexer.FlexAdapter

/**
 * @author pbb
 * @date 2023/4/23
 */
class NebulaLexerAdapter : FlexAdapter {
    constructor() : super(NebulaLexer(null))
}