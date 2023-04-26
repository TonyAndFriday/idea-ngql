package com.tony.nebulahighlight.language

import com.intellij.lexer.Lexer
import com.intellij.openapi.editor.DefaultLanguageHighlighterColors
import com.intellij.openapi.editor.HighlighterColors
import com.intellij.openapi.editor.colors.TextAttributesKey
import com.intellij.openapi.fileTypes.SyntaxHighlighterBase
import com.intellij.psi.tree.IElementType
import com.tony.nebulahighlight.language.psi.NebulaTypes
import com.intellij.openapi.editor.colors.TextAttributesKey.createTextAttributesKey


/**
 * @author pbb
 * @date 2023/4/24
 */
class NebulaSyntaxHighlighter : SyntaxHighlighterBase() {

    val SEPARATOR: TextAttributesKey = createTextAttributesKey("SIMPLE_SEPARATOR", DefaultLanguageHighlighterColors.OPERATION_SIGN)
    val IDENTIFIER_KEY: TextAttributesKey = createTextAttributesKey("SIMPLE_IDENTIFIER", DefaultLanguageHighlighterColors.IDENTIFIER)
    val KEY: TextAttributesKey = createTextAttributesKey("SIMPLE_KEY", DefaultLanguageHighlighterColors.KEYWORD)
    val STRING_KEY: TextAttributesKey = createTextAttributesKey("SIMPLE_STRING", DefaultLanguageHighlighterColors.STRING)
    val FUNCTION_D: TextAttributesKey = createTextAttributesKey("SIMPLE_FUNCTION", DefaultLanguageHighlighterColors.FUNCTION_DECLARATION)
    val CONSTANT: TextAttributesKey = createTextAttributesKey("SIMPLE_CONSTANT", DefaultLanguageHighlighterColors.CONSTANT)
    val COMMENT: TextAttributesKey = createTextAttributesKey("SIMPLE_COMMENT", DefaultLanguageHighlighterColors.LINE_COMMENT)


    private val TYPE = arrayOf(CONSTANT)
    private val KEYWORD = arrayOf(KEY)
    private val FUNCTION = arrayOf(FUNCTION_D)
    private val IDENTIFIER = arrayOf(IDENTIFIER_KEY)
    private val STRING = arrayOf(STRING_KEY)
    private val COMMENT_KEYS = arrayOf(COMMENT)
    private val EMPTY_KEYS = arrayOfNulls<TextAttributesKey>(0)


    override fun getHighlightingLexer(): Lexer {
        return NebulaLexerAdapter()
    }

    override fun getTokenHighlights(tokenType: IElementType?): Array<out TextAttributesKey?> {
        if (tokenType == NebulaTypes.IDENTIFIER) {
            return IDENTIFIER;
        }
        if (tokenType == NebulaTypes.STRING) {
            return STRING;
        }
        if (tokenType == NebulaTypes.FUNCTION) {
            return FUNCTION;
        }
        if (tokenType == NebulaTypes.TYPE) {
            return TYPE;
        }
        if (tokenType == NebulaTypes.KEYWORD) {
            return KEYWORD;
        }
        if (tokenType == NebulaTypes.COMMENT) {
            return COMMENT_KEYS;
        }
        return EMPTY_KEYS;
    }
}