Report 50099 "Open Orders"
{
    // // iCepts dxd 10.09.13 -Upgrade2013                             iCepts1.00
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/OpenOrders.rdlc';


    dataset
    {
        dataitem("Sales Line";"Sales Line")
        {
            DataItemTableView = sorting("Document Type","Document No.","Line No.");
            RequestFilterFields = "Document Type","Document No.";
            column(ReportForNavId_2844; 2844)
            {
            }
            column(FORMAT_TODAY_0_4_;Format(Today,0,4))
            {
            }
            column(COMPANYNAME;COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO;CurrReport.PageNo)
            {
            }
            column(UserId;UserId)
            {
            }
            column(Sales_Line__Document_Type_;"Document Type")
            {
            }
            column(Sales_Line__Document_No__;"Document No.")
            {
            }
            column(Sales_Line__Sell_to_Customer_No__;"Sell-to Customer No.")
            {
            }
            column(Sales_Line__Document_No___Control1000000017;"Document No.")
            {
            }
            column(Sales_Line__Line_No__;"Line No.")
            {
            }
            column(Sales_Line_Type;Type)
            {
            }
            column(Sales_Line__No__;"No.")
            {
            }
            column(Sales_Line_Description;Description)
            {
            }
            column(Sales_Line__Outstanding_Quantity_;"Outstanding Quantity")
            {
            }
            column(Sales_Line_Amount;Amount)
            {
            }
            column(TotalFor___FIELDCAPTION__Document_No___;TotalFor + FieldCaption("Document No."))
            {
            }
            column(Sales_Line_Amount_Control1000000038;Amount)
            {
            }
            column(TotalFor___FIELDCAPTION__Document_Type__;TotalFor + FieldCaption("Document Type"))
            {
            }
            column(Sales_Line_Amount_Control1000000040;Amount)
            {
            }
            column(Sales_LineCaption;Sales_LineCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Sales_Line__Sell_to_Customer_No__Caption;FieldCaption("Sell-to Customer No."))
            {
            }
            column(Sales_Line__Document_No___Control1000000017Caption;FieldCaption("Document No."))
            {
            }
            column(Sales_Line__Line_No__Caption;FieldCaption("Line No."))
            {
            }
            column(Sales_Line_TypeCaption;FieldCaption(Type))
            {
            }
            column(Sales_Line__No__Caption;FieldCaption("No."))
            {
            }
            column(Sales_Line_DescriptionCaption;FieldCaption(Description))
            {
            }
            column(Sales_Line__Outstanding_Quantity_Caption;FieldCaption("Outstanding Quantity"))
            {
            }
            column(Sales_Line_AmountCaption;FieldCaption(Amount))
            {
            }
            column(Sales_Line__Document_Type_Caption;FieldCaption("Document Type"))
            {
            }
            column(Sales_Line__Document_No__Caption;FieldCaption("Document No."))
            {
            }

            trigger OnPreDataItem()
            begin
                LastFieldNo := FieldNo("Document No.");
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: label 'Total for ';
        Sales_LineCaptionLbl: label 'Sales Line';
        CurrReport_PAGENOCaptionLbl: label 'Page';
}

