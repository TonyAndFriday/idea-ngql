package com.tony.nebulahighlight.language

import com.intellij.openapi.fileTypes.LanguageFileType
import javax.swing.Icon

/**
 * @author pbb
 * @date 2023/4/23
 */
class NebulaFileType() : LanguageFileType(NebulaLanguage.nebulaLanguage) {

    override fun getName(): String {
        return "nGQL"
    }

    override fun getDescription(): String {
        return "Nebula language file";
    }

    override fun getDefaultExtension(): String {
        return "ngql"
    }

    override fun getIcon(): Icon {
        return NebulaIcons.icon
    }

    companion object {
        val INSTANCE = NebulaFileType()
    }

}