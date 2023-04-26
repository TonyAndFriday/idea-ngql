package com.tony.nebulahighlight.language.psi

import com.intellij.psi.tree.IElementType
import com.tony.nebulahighlight.language.NebulaLanguage
import org.jetbrains.annotations.NonNls

/**
 * @author pbb
 * @date 2023/4/23
 */
class NebulaElementType : IElementType {
    constructor(debugName: @NonNls String) : super(debugName, NebulaLanguage.nebulaLanguage)
}