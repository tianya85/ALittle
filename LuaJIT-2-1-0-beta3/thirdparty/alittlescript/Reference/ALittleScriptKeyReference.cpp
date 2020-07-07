#include "ALittleScriptKeyReference.h"

#include "../Index/ALittleScriptIndex.h"

int ALittleScriptKeyReference::QueryClassificationTag(bool& blur)
{
    auto element = m_element.lock();
    if (element == nullptr) return 0;

    blur = false;
    auto text = element->GetElementText();

    auto* index = GetIndex();
    if (index->sCtrlKeyWord.find(text) != index->sCtrlKeyWord.end())
        return ALittleScriptColorType::ALittleScriptCtrlKeyWord;
    return ALittleScriptColorType::ALittleScriptKeyWord;
}

ABnfElementPtr ALittleScriptKeyReference::GotoDefinition()
{
    auto element = m_element.lock();
    if (element == nullptr) return nullptr;
    auto parent = element->GetParent();
    if (parent == nullptr) return nullptr;
    return parent->GetReference()->GotoDefinition();
}

bool ALittleScriptKeyReference::CanGotoDefinition()
{
    return false;
}