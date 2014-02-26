<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="BusInfo._Default" %>


<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
     <div id="WebApp">

        <div id="iHeader">
            <a href="#" id="waBackButton">Back</a>
            <a href="#" id="waHomeButton">Home</a>
            <span id="waHeadTitle">Bus Info</span>
        </div>

        <div id="iGroup">

            <div class="iLayer" id="waAllwood" title="Allwood">
                <div class="iBlock">
                   
                    <h1>  To Home
                    <asp:Label ID="toAllwoodlbl" runat="server" Text="Label"></asp:Label>
                   </h1>
                    <asp:GridView ID="ToAllwoodGV" runat="server" Width="200">
      
                    </asp:GridView>
                    

                      <a href="#_AllwoodDetails">Details</a> 
                     <a href="#_NY">To New York</a>  
                     <a href="Doc/T1192.pdf">pdf</a>
                  
                </div>
            </div>

            <div class="iLayer" id="waNY" title="New York">
                <div class="iBlock">
                     <h1> To New York
                    <asp:Label ID="toNYlbl" runat="server" Text="Label"></asp:Label>
                     </h1> 
                    <asp:GridView ID="ToNYGV" runat="server">
  
                    </asp:GridView>
                   
                      <a href="#_NYDetails">Details</a> 
                      <a href="#_Allwood">To Allwood</a>
                   
                </div>
            </div>
            <div class="iLayer" id="waNYDetails" title="New York All">
                <div class="iBlock">
                    <h1>To New York All</h1>
                    <asp:GridView ID="ToNYAllGV" runat="server">
        
                     </asp:GridView>
                     <a href="#_NY">To New York</a>
                </div>
            </div>
            <div class="iLayer" id="waAllwoodDetails" title="Allwood All">
                <div class="iBlock">
  
                     <p> <a href="#_Allwood">To Allwood</a> </p>
                     <asp:GridView ID="TOAllwoodAllGV" runat="server">
  
                     </asp:GridView>
                      <a href="#_Allwood">Back</a>
                </div>
            </div>
        </div>
    </div>
    <div>
    
</div>
<div>

</div>
</asp:Content>


