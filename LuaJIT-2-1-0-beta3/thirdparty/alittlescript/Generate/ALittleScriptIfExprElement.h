#ifndef _ALITTLE_ALittleScriptIfExprElement_H_
#define _ALITTLE_ALittleScriptIfExprElement_H_

#include <memory>
#include <vector>
#include <string>
#include "../../alanguage/Model/ABnfNodeElement.h"

class ALittleScriptIfConditionElement;
class ALittleScriptAllExprElement;
class ALittleScriptIfBodyElement;
class ALittleScriptElseIfExprElement;
class ALittleScriptElseExprElement;
class ALittleScriptKeyElement;

class ALittleScriptIfExprElement : public ABnfNodeElement
{
public:
    ALittleScriptIfExprElement(ABnfFactory* factory, ABnfFile* file, int line, int col, int offset, const std::string& type)
        : ABnfNodeElement(factory, file, line, col, offset, type) { }
    virtual ~ALittleScriptIfExprElement() { }

private:
    bool m_flag_IfCondition = false;
    std::shared_ptr<ALittleScriptIfConditionElement> m_cache_IfCondition;
public:
    std::shared_ptr<ALittleScriptIfConditionElement> GetIfCondition()
    {
        if (m_flag_IfCondition) return m_cache_IfCondition;
        m_flag_IfCondition = true;
        for (auto& child : m_childs)
        {
            auto node = std::dynamic_pointer_cast<ALittleScriptIfConditionElement>(child);
            if (node != nullptr)
            {
                m_cache_IfCondition = node;
                break;
            }
        }
        return m_cache_IfCondition;
    }
private:
    bool m_flag_AllExpr = false;
    std::shared_ptr<ALittleScriptAllExprElement> m_cache_AllExpr;
public:
    std::shared_ptr<ALittleScriptAllExprElement> GetAllExpr()
    {
        if (m_flag_AllExpr) return m_cache_AllExpr;
        m_flag_AllExpr = true;
        for (auto& child : m_childs)
        {
            auto node = std::dynamic_pointer_cast<ALittleScriptAllExprElement>(child);
            if (node != nullptr)
            {
                m_cache_AllExpr = node;
                break;
            }
        }
        return m_cache_AllExpr;
    }
private:
    bool m_flag_IfBody = false;
    std::shared_ptr<ALittleScriptIfBodyElement> m_cache_IfBody;
public:
    std::shared_ptr<ALittleScriptIfBodyElement> GetIfBody()
    {
        if (m_flag_IfBody) return m_cache_IfBody;
        m_flag_IfBody = true;
        for (auto& child : m_childs)
        {
            auto node = std::dynamic_pointer_cast<ALittleScriptIfBodyElement>(child);
            if (node != nullptr)
            {
                m_cache_IfBody = node;
                break;
            }
        }
        return m_cache_IfBody;
    }
private:
    bool m_flag_ElseIfExpr = false;
    std::vector<std::shared_ptr<ALittleScriptElseIfExprElement>> m_list_ElseIfExpr;
public:
    const std::vector<std::shared_ptr<ALittleScriptElseIfExprElement>>& GetElseIfExprList()
    {
        if (m_flag_ElseIfExpr) return m_list_ElseIfExpr;
        m_flag_ElseIfExpr = true;
        for (auto& child : m_childs)
        {
            auto node = std::dynamic_pointer_cast<ALittleScriptElseIfExprElement>(child);
            if (node != nullptr)
                m_list_ElseIfExpr.push_back(node);
        }
        return m_list_ElseIfExpr;
    }
private:
    bool m_flag_ElseExpr = false;
    std::shared_ptr<ALittleScriptElseExprElement> m_cache_ElseExpr;
public:
    std::shared_ptr<ALittleScriptElseExprElement> GetElseExpr()
    {
        if (m_flag_ElseExpr) return m_cache_ElseExpr;
        m_flag_ElseExpr = true;
        for (auto& child : m_childs)
        {
            auto node = std::dynamic_pointer_cast<ALittleScriptElseExprElement>(child);
            if (node != nullptr)
            {
                m_cache_ElseExpr = node;
                break;
            }
        }
        return m_cache_ElseExpr;
    }
private:
    bool m_flag_Key = false;
    std::shared_ptr<ALittleScriptKeyElement> m_cache_Key;
public:
    std::shared_ptr<ALittleScriptKeyElement> GetKey()
    {
        if (m_flag_Key) return m_cache_Key;
        m_flag_Key = true;
        for (auto& child : m_childs)
        {
            auto node = std::dynamic_pointer_cast<ALittleScriptKeyElement>(child);
            if (node != nullptr)
            {
                m_cache_Key = node;
                break;
            }
        }
        return m_cache_Key;
    }
};

#endif // _ALITTLE_ALittleScriptIfExprElement_H_
