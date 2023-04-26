package com.tony.nebulahighlight.language

import com.intellij.extapi.psi.PsiFileBase
import com.intellij.openapi.fileTypes.FileType
import com.intellij.psi.FileViewProvider

/**
 * @author pbb
 * @date 2023/4/24
 */
class NebulaFile(f : FileViewProvider) : PsiFileBase(f, NebulaLanguage.nebulaLanguage) {
    override fun getFileType(): FileType {
        return NebulaFileType.INSTANCE
    }

    override fun toString(): String {
        return "Nebula File"
    }
}