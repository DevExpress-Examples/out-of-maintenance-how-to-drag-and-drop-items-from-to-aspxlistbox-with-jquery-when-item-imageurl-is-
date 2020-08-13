<%@ Page Title="Home Page" Language="vb" MasterPageFile="~/Site.master" AutoEventWireup="true"
	CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGlobalEvents" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
	<script src="Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
	<script src="Scripts/jquery-ui-1.8.21.custom.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		function InitalizejQuery() {
			$('.dxeListBoxItemRow').draggable(
				{
					helper: 'clone'
				}
			);

			$('.dxeListBoxItemRow').draggable(
				{
					helper: function (event) {
						return $('<div><table style=\"width: 50px"></table></div>')
							.find('table').append($(event.target).closest('tr').clone()).end().insertAfter($(event.target).closest("table"));
					}
				}
			);

				$('.listBoxRight,.listBoxLeft').droppable(
				{
					activeClass: "hover",
					drop: function (ev, ui) {

						/* do nothing when the parent == destination */
						if ($(ui.draggable).parents(".listBoxLeft").length != 0 && ($(this)).hasClass("listBoxLeft") ||
							$(ui.draggable).parents(".listBoxRight").length != 0 && ($(this)).hasClass("listBoxRight"))
							return;

						var itemIndex = $(ui.draggable).parent().index(); // this is a fragile part of the application

						var fromListBox, toListBox;

						if ($(this).hasClass("listBoxRight")) { // determine a source and a destination
							toListBox = lbChosen;
							fromListBox = lbAvailable;

						}
						else {
							toListBox = lbAvailable;
							fromListBox = lbChosen;

						}
						var imageUrl = "Images/" + fromListBox.GetItem(itemIndex).imageUrl.substring(fromListBox.GetItem(itemIndex).imageUrl.lastIndexOf('/') + 1);
					   // alert(imageUrl);
						toListBox.AddItem(fromListBox.GetItem(itemIndex).text,
										  fromListBox.GetItem(itemIndex).value,
										  imageUrl);
						fromListBox.RemoveItem(itemIndex);
						InitalizejQuery(); // repeat the initialization for new items
					}
				}
			  );
		}
	</script>
	<style type="text/css">
		.lbItem
		{
			width: 200px;
		}

		/* like SelectedItem style */
		.ui-draggable-dragging
		{
			background-color: #A0A0A0;
			color: White;
		}

		/* small glowing effect */
		.hover
		{
			-webkit-box-shadow: 0 0 15px #ff0000;
			-moz-box-shadow: 0 0 15px #ff0000;
			box-shadow: 0 0 15px #ff0000;
		}
	</style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
	<div>
		<dx:ASPxGlobalEvents ID="ge" runat="server">
			<ClientSideEvents ControlsInitialized="function (s, e) { InitalizejQuery(); }" />
		</dx:ASPxGlobalEvents>
		<table>
			<tr>
				<td style="width: 35%">
					<dx:ASPxListBox ID="lbAvailable" runat="server" ClientInstanceName="lbAvailable"
						Width="200px" Height="240px" CssClass="listBoxLeft">
						<ItemStyle CssClass="lbItem" />
						<Items>
							<dx:ListEditItem Text="ASPxEditors Library" Value="ASPxEditors" ImageUrl="Images/ASPxEditors.png" />
							<dx:ListEditItem Text="ASPxGridView Library" Value="ASPxGridView" ImageUrl="Images/ASPxGridView.png" />

						</Items>
					</dx:ASPxListBox>
				</td>
				<td style="width: 30%">
				</td>
				<td style="width: 35%">
					<dx:ASPxListBox ID="lbChosen" runat="server" ClientInstanceName="lbChosen" Width="200px"
						Height="240px" CssClass="listBoxRight">
						<ItemStyle CssClass="lbItem" />
						<Items>
							<dx:ListEditItem Text="ASPxTreeList Library" Value="ASPxListBox" ImageUrl="Images/ASPxTreeList.png" />
						</Items>
					</dx:ASPxListBox>
				</td>
			</tr>
		</table>
	</div>
</asp:Content>