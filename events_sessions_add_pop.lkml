#STEP 1) ENSURE YOUR BASE VIEW IS INCLUDED
include: "/event_sessions.view"
#STEP 2) UPDATE THE VIEW NAME. USE THE NAME OF THE VIEW THAT HAS THE PERIOD OVER PERIOD BASE FIELD, WITH A PLUS SIGN IN FRONT.
view: +event_sessions {
#STEP 3) UPDATE THE DIMENSION_GROUP NAME TO MATCH YOUR TARGET PERIOD OVER PERIOD BASE FIELD's DIMENSION_GROUP_NAME.  JUST THE NAME 'eg created'.
  dimension_group: session {
    convert_tz: no datatype: timestamp #we will have to apply timezone conversion manually, before manipulating dates.  Hence convert_tz:no, and datatype timestamp used.
    sql:
    {%if pop_standard_fields.period._is_selected%}
      timestamp(
        case when pop_standard_fields.period = 'prior' then
          datetime_add(
            {{pop_standard_fields.manual_convert_tz__sql_start._sql}}${EXTENDED}{{pop_standard_fields.manual_convert_tz__sql_end._sql}}
            ,interval {{pop_standard_fields.created_date_timeframes_to_offset_by._parameter_value}} {{pop_standard_fields.created_date_pop_offset_timeframe_size._parameter_value}}
          )
        else {{pop_standard_fields.manual_convert_tz__sql_start._sql}}${EXTENDED}{{pop_standard_fields.manual_convert_tz__sql_end._sql}}
        end
      )
    {%else%} timestamp({{pop_standard_fields.manual_convert_tz__sql_start._sql}}${EXTENDED}{{pop_standard_fields.manual_convert_tz__sql_end._sql}})
    {%endif%}
    ;;
  }
}
#STEP 4 (THE LAST):Include this file above your explore definition.


#You should not need to touch the code below. If you end up adding pop to multiple views, you may need to move this to it's own file to avoid duplicate declarations
view:join_pop_standard_fields{}
explore: join_pop_standard_fields {
  extension: required
  join: pop_standard_fields  {type: cross relationship:one_to_one}
}
view: pop_standard_fields {
  derived_table: {sql: select * from (select 'current' as period union all select 'prior') periods ;;}
  dimension: period {view_label: "Period Over Period" label:"Period" description:"add to pivot"}#_is_selected is checked on this field to.  Makes source data duplicate, and makes targeted date fields handle date manipulation

  dimension: manual_convert_tz__sql_start {hidden: yes sql:cast(TIMESTAMP(FORMAT_TIMESTAMP('%F %T', TIMESTAMP(FORMAT_TIMESTAMP('%F %H:%M:%E*S',;;}
  dimension: manual_convert_tz__sql_end {hidden: yes sql:,'{{_query._query_timezone}}')))) as datetime);;}

  parameter: created_date_timeframes_to_offset_by {
    view_label: "Period Over Period"
    label: "Config POP 1 - Enter an Offset Number"
    type:number
    default_value: "1"
  }

  parameter: created_date_pop_offset_timeframe_size {
    view_label: "Period Over Period"
    label: "Config POP 2 - Enter an Offset Grain"
    type: unquoted
    allowed_value: {value:"Day"}
    allowed_value: {value:"Week"}
    allowed_value: {value:"Month"}
    allowed_value: {value:"Quarter"}
    allowed_value: {value:"Year"}
    default_value: "Year"
  }
}
