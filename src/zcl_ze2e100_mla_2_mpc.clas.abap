class ZCL_ZE2E100_MLA_2_MPC definition
  public
  inheriting from /IWBEP/CL_MGW_PUSH_ABS_MODEL
  create public .

public section.

  interfaces IF_SADL_GW_MODEL_EXPOSURE_DATA .

  types:
    begin of TS_SEPM_I_BUSINESSPARTNER_ETYP.
      include type SEPM_I_BUSINESSPARTNER_E.
      include type INCL_TRF_SNWD_BPA.
  types:
    end of TS_SEPM_I_BUSINESSPARTNER_ETYP .
  types:
   TT_SEPM_I_BUSINESSPARTNER_ETYP type standard table of TS_SEPM_I_BUSINESSPARTNER_ETYP .
  types:
    begin of TS_SEPM_I_SALESORDERITEM_ETYPE.
      include type SEPM_I_SALESORDERITEM_E.
      include type SNWD_SOI_INCL_EEW_TR.
  types:
      generated_id type string,
      T_SALESORDERITEM type SEPM_I_SALESORDERITEMTEXT_E-SALESORDERITEMNOTE,
    end of TS_SEPM_I_SALESORDERITEM_ETYPE .
  types:
   TT_SEPM_I_SALESORDERITEM_ETYPE type standard table of TS_SEPM_I_SALESORDERITEM_ETYPE .
  types:
    begin of TS_ZSEPM_C_SALESORDER_MLATYPE.
      include type ZSEPM_C_SALESORDER_MLA.
  types:
      T_SALESORDER type SEPM_I_SALESORDERTEXT_E-SALESORDERNOTE,
    end of TS_ZSEPM_C_SALESORDER_MLATYPE .
  types:
   TT_ZSEPM_C_SALESORDER_MLATYPE type standard table of TS_ZSEPM_C_SALESORDER_MLATYPE .

  constants GC_SEPM_I_BUSINESSPARTNER_ETYP type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'SEPM_I_BusinessPartner_EType' ##NO_TEXT.
  constants GC_SEPM_I_SALESORDERITEM_ETYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'SEPM_I_SalesOrderItem_EType' ##NO_TEXT.
  constants GC_ZSEPM_C_SALESORDER_MLATYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'ZSEPM_C_SALESORDER_MLAType' ##NO_TEXT.

  methods DEFINE
    redefinition .
  methods GET_LAST_MODIFIED
    redefinition .
protected section.
private section.

  methods DEFINE_RDS_4
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods GET_LAST_MODIFIED_RDS_4
    returning
      value(RV_LAST_MODIFIED_RDS) type TIMESTAMP .
ENDCLASS.



CLASS ZCL_ZE2E100_MLA_2_MPC IMPLEMENTATION.


  method DEFINE.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*

model->set_schema_namespace( 'ZE2E100_MLA_2_SRV' ).

define_rds_4( ).
get_last_modified_rds_4( ).
  endmethod.


  method DEFINE_RDS_4.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*
*   This code is generated for Reference Data Source
*   4
*&---------------------------------------------------------------------*
    TRY.
        if_sadl_gw_model_exposure_data~get_model_exposure( )->expose( model )->expose_vocabulary( vocab_anno_model ).
      CATCH cx_sadl_exposure_error INTO DATA(lx_sadl_exposure_error).
        RAISE EXCEPTION TYPE /iwbep/cx_mgw_med_exception
          EXPORTING
            previous = lx_sadl_exposure_error.
    ENDTRY.
  endmethod.


  method GET_LAST_MODIFIED.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*


  CONSTANTS: lc_gen_date_time TYPE timestamp VALUE '20200525090914'.                  "#EC NOTEXT
 DATA: lv_rds_last_modified TYPE timestamp .
  rv_last_modified = super->get_last_modified( ).
  IF rv_last_modified LT lc_gen_date_time.
    rv_last_modified = lc_gen_date_time.
  ENDIF.
 lv_rds_last_modified =  GET_LAST_MODIFIED_RDS_4( ).
 IF rv_last_modified LT lv_rds_last_modified.
 rv_last_modified  = lv_rds_last_modified .
 ENDIF .
  endmethod.


  method GET_LAST_MODIFIED_RDS_4.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*
*   This code is generated for Reference Data Source
*   4
*&---------------------------------------------------------------------*
*    @@TYPE_SWITCH:
    CONSTANTS: co_gen_date_time TYPE timestamp VALUE '20200525090915'.
    TRY.
        rv_last_modified_rds = CAST cl_sadl_gw_model_exposure( if_sadl_gw_model_exposure_data~get_model_exposure( ) )->get_last_modified( ).
      CATCH cx_root ##CATCH_ALL.
        rv_last_modified_rds = co_gen_date_time.
    ENDTRY.
    IF rv_last_modified_rds < co_gen_date_time.
      rv_last_modified_rds = co_gen_date_time.
    ENDIF.
  endmethod.


  method IF_SADL_GW_MODEL_EXPOSURE_DATA~GET_MODEL_EXPOSURE.
    CONSTANTS: co_gen_timestamp TYPE timestamp VALUE '20200525090917'.
    DATA(lv_sadl_xml) =
               |<?xml version="1.0" encoding="utf-16"?>|  &
               |<sadl:definition xmlns:sadl="http://sap.com/sap.nw.f.sadl" syntaxVersion="" >|  &
               | <sadl:dataSource type="CDS" name="SEPM_I_BUSINESSPARTNER_E" binding="SEPM_I_BUSINESSPARTNER_E" />|  &
               | <sadl:dataSource type="CDS" name="SEPM_I_SALESORDERITEM_E" binding="SEPM_I_SALESORDERITEM_E" />|  &
               | <sadl:dataSource type="CDS" name="ZSEPM_C_SALESORDER_MLA" binding="ZSEPM_C_SALESORDER_MLA" />|  &
               |<sadl:resultSet>|  &
               |<sadl:structure name="SEPM_I_BusinessPartner_E" dataSource="SEPM_I_BUSINESSPARTNER_E" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="SEPM_I_SalesOrderItem_E" dataSource="SEPM_I_SALESORDERITEM_E" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="ZSEPM_C_SALESORDER_MLA" dataSource="ZSEPM_C_SALESORDER_MLA" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               | <sadl:association name="TO_CUSTOMER" binding="_CUSTOMER" target="SEPM_I_BusinessPartner_E" cardinality="zeroToOne" />|  &
               | <sadl:association name="TO_ITEM" binding="_ITEM" target="SEPM_I_SalesOrderItem_E" cardinality="zeroToMany" />|  &
               |</sadl:structure>|  &
               |</sadl:resultSet>|  &
               |</sadl:definition>| .

   ro_model_exposure = cl_sadl_gw_model_exposure=>get_exposure_xml( iv_uuid      = CONV #( 'ZE2E100_MLA_2' )
                                                                    iv_timestamp = co_gen_timestamp
                                                                    iv_sadl_xml  = lv_sadl_xml ).
  endmethod.
ENDCLASS.
