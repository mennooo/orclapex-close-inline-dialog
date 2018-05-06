prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_180100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2018.04.04'
,p_release=>'18.1.0.00.43'
,p_default_workspace_id=>10390063953384733491
,p_default_application_id=>115922
,p_default_owner=>'CITIEST'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/mho_close_inline_dialog
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(2960904188562465485)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'MHO.CLOSE_INLINE_DIALOG'
,p_display_name=>'Close Inline Dialog'
,p_category=>'NAVIGATION'
,p_supported_ui_types=>'DESKTOP'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function render(',
'  p_dynamic_action apex_plugin.t_dynamic_action',
', p_plugin         apex_plugin.t_plugin',
') return apex_plugin.t_dynamic_action_render_result',
'is',
'',
'  l_js     varchar2(4000);',
'  l_result apex_plugin.t_dynamic_action_render_result;',
'',
'begin',
'',
'  apex_plugin_util.debug_dynamic_action(',
'    p_plugin         => p_plugin',
'  , p_dynamic_action => p_dynamic_action);',
'',
'  l_js :=',
'  q''[function() {',
'    let el$ = this.affectedElements.dialog("option", "triggeringElement") || $(this.triggeringElement);',
'    this.affectedElements.dialog("close");',
'    el$.trigger("mho:inlinedialogclosed");',
'  }]'';',
'',
'  l_result.javascript_function := l_js;',
'',
'  return l_result;',
'',
'end render;'))
,p_api_version=>1
,p_render_function=>'render'
,p_standard_attributes=>'REGION:REQUIRED'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_about_url=>'www.menn.ooo'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(2967462469908192734)
,p_plugin_id=>wwv_flow_api.id(2960904188562465485)
,p_name=>'mho:inlinedialogclosed'
,p_display_name=>'Inline Dialog Closed'
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
