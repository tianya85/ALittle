#ifndef _ALITTLE_ALittleScriptOp3SuffixElement_H_
#define _ALITTLE_ALittleScriptOp3SuffixElement_H_

#include <memory>
#include <vector>
#include <string>
#include "../../alanguage/Model/ABnfNodeElement.h"

class ALittleScriptOp3Element;
class ALittleScriptValueFactorStatElement;
class ALittleScriptOp2ValueElement;

class ALittleScriptOp3SuffixElement : public ABnfNodeElement
{
public:
    ALittleScriptOp3SuffixElement(ABnfFactory* factory, ABnfFile* file, int line, int col, int offset, const std::string& type)
        : ABnfNodeElement(factory, file, line, col, offset, type) { }
    virtual ~ALittleScriptOp3SuffixElement() { }

private:
    bool m_flag_Op3 = false;
    std::shared_ptr<ALittleScriptOp3Element> m_cache_Op3;
public:
    std::shared_ptr<ALittleScriptOp3Element> GetOp3()
    {
        if (m_flag_Op3) return m_cache_Op3;
        m_flag_Op3 = true;
        for (auto& child : m_childs)
        {
            auto node = std::dynamic_pointer_cast<ALittleScriptOp3Element>(child);
            if (node != nullptr)
            {
                m_cache_Op3 = node;
                break;
            }
        }
        return m_cache_Op3;
    }
private:
    bool m_flag_ValueFactorStat = false;
    std::shared_ptr<ALittleScriptValueFactorStatElement> m_cache_ValueFactorStat;
public:
    std::shared_ptr<ALittleScriptValueFactorStatElement> GetValueFactorStat()
    {
        if (m_flag_ValueFactorStat) return m_cache_ValueFactorStat;
        m_flag_ValueFactorStat = true;
        for (auto& child : m_childs)
        {
            auto node = std::dynamic_pointer_cast<ALittleScriptValueFactorStatElement>(child);
            if (node != nullptr)
            {
                m_cache_ValueFactorStat = node;
                break;
            }
        }
        return m_cache_ValueFactorStat;
    }
private:
    bool m_flag_Op2Value = false;
    std::shared_ptr<ALittleScriptOp2ValueElement> m_cache_Op2Value;
public:
    std::shared_ptr<ALittleScriptOp2ValueElement> GetOp2Value()
    {
        if (m_flag_Op2Value) return m_cache_Op2Value;
        m_flag_Op2Value = true;
        for (auto& child : m_childs)
        {
            auto node = std::dynamic_pointer_cast<ALittleScriptOp2ValueElement>(child);
            if (node != nullptr)
            {
                m_cache_Op2Value = node;
                break;
            }
        }
        return m_cache_Op2Value;
    }
};

#endif // _ALITTLE_ALittleScriptOp3SuffixElement_H_