
#include "ABnfKeyReference.h"
#include "../../alanguage/Model/ABnfElement.h"
#include "../../alanguage/Model/ABnfNodeElement.h"
#include "../../alanguage/Model/ABnf.h"
#include "../Index/ABnfFileClass.h"

#include <unordered_set>

ABnfKeyReference::ABnfKeyReference(ABnfElementPtr element) : ABnfCommonReference(element)
{
}

ABnfGuessError ABnfKeyReference::CheckError()
{
    auto element = m_element.lock();
    if (element == nullptr) return nullptr;

    if (element->GetLength() <= 2)
        return ABnfGuessError(element, "key can't not be empty");

    return nullptr;
}

void ABnfKeyReference::QueryQuickInfo(std::string& info)
{
    info = "key word: Any regular expression encounters a keyword, even if the match is successful, it is considered a failure, to ensure that the keyword has a high resolution priority";
}
