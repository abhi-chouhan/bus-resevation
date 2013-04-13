<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="BusInfo._Default" %>


<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
     <div id="WebApp">

        <div id="iHeader">
            <a href="#" id="waBackButton">Back</a>
            <span id="waHeadTitle">Bus Info</span>
        </div>

        <div id="iGroup">

            <div class="iLayer" id="waAllwood" title="Allwood">
                <div class="iBlock">
                     <p>  <a href="#_NY">To New York</a>  </p>
                    <asp:GridView ID="ToAllwoodGV" runat="server"/>
                  
                </div>
            </div>

            <div class="iLayer" id="waNY" title="New York">
                <div class="iBlock">
                     <p> <a href="#_Allwood">To Allwood</a> </p>
                    <asp:GridView ID="ToNYGV" runat="server"/>
                      <a href="#_NYDetails">Details</a> 
                  
                   
                </div>
            </div>
            <div class="iLayer" id="waNYDetails" title="New York All">
                <div class="iBlock">
                    <h1>To New York All</h1>
                     <p> <a href="#_NY">To New York</a> </p>
                     <asp:GridView ID="ToNYAllGV" runat="server">
                  </asp:GridView>
                   
                </div>
            </div>
            <div class="iLayer" id="waAllwoodDetails" title="Allwood All">
                <div class="iBlock">
  
                     <p> <a href="#_Home">To Allwood</a> </p>
                     <asp:GridView ID="TOAllwoodAllGV" runat="server">
                  </asp:GridView>
                   
                </div>
            </div>
        </div>
    </div>
    <div>
    
</div>
<div>

</div>
</asp:Content>


