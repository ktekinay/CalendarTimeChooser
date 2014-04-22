#tag Window
Begin ContainerControl Date_Time_Container
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &c9D9D9D00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   True
   Height          =   227
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   0
   Transparent     =   True
   UseFocusRing    =   False
   Visible         =   True
   Width           =   394
   Begin Timer ClockSecondHandTimer
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockedInPosition=   False
      Mode            =   2
      Period          =   1000
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   0
      Width           =   32
   End
   Begin Separator Separator1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   255
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   232
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   97
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   -1
      Visible         =   True
      Width           =   4
   End
   Begin Calendar_Container Calendar_Container1
      AcceptFocus     =   True
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Backdrop        =   0
      Enabled         =   True
      EraseBackground =   False
      HasBackColor    =   False
      Height          =   213
      HelpTag         =   ""
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   100
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   5
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   230
   End
   Begin Time_Container Time_Container1
      AcceptFocus     =   False
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Backdrop        =   0
      ClockSecondsCounter=   0
      Enabled         =   True
      EraseBackground =   True
      HasBackColor    =   False
      Height          =   213
      HelpTag         =   ""
      InitialParent   =   ""
      Left            =   235
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   101
      TabPanelIndex   =   0
      TabStop         =   True
      Time_AMPM       =   "AM"
      Time_AMPM_Len   =   0
      Time_Hour       =   "12"
      Time_Hour_Len   =   0
      Time_Minute     =   "00"
      Time_Minute_Len =   0
      Top             =   5
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   156
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  if asc(key)=27 then
		    me.close
		    Return True
		  end
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  If BothPickers = True Then
		    mSetupForBothPickers
		  Elseif CalendarPicker_Only = True Then
		    mSetupForCalendarPickerOnly
		  Elseif TimePicker_Only = True Then
		    mSetupForTimePickerOnly
		  End if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub mSetupForBothPickers()
		  window.Width = 394
		  window.Height = 227
		  
		  TrueWindow.Title = "Choose Date and Time"
		  Calendar_Container1.Enabled = True
		  Calendar_Container1.Visible = True
		  Time_Container1.Left = 235
		  Time_Container1.Enabled = True
		  Time_Container1.Visible = True
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub mSetupForCalendarPickerOnly()
		  window.Width = 230
		  window.Height = 227
		  
		  TrueWindow.Title = "Choose Date"
		  Calendar_Container1.Enabled = True
		  Calendar_Container1.Visible = True
		  Time_Container1.Enabled = False
		  Time_Container1.Visible = False
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub mSetupForTimePickerOnly()
		  window.Width = 156
		  window.Height = 195
		  
		  TrueWindow.Title = "Choose Time"
		  Time_Container1.Enabled = True
		  Time_Container1.Visible = True
		  Time_Container1.Left = 0
		  //
		  Calendar_Container1.Enabled = False
		  Calendar_Container1.Visible = False
		  
		  'BackColor = RGB(228,228,228)
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		BothPickers As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		CalendarPicker_Only As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		SelectClockFaceType As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		TimePicker_Only As Boolean = False
	#tag EndProperty


#tag EndWindowCode

#tag Events ClockSecondHandTimer
	#tag Event
		Sub Action()
		  // This controls the Clock's Second Hand
		  
		  Time_Container1.ClockSecondsCounter = Time_Container1.ClockSecondsCounter + 1
		  if Time_Container1.ClockSecondsCounter = 0 Then
		    Time_Container1.ClockSecondsCounter = -1
		  Elseif Time_Container1.ClockSecondsCounter = 60 Then
		    Time_Container1.ClockSecondsCounter = 0
		  End if
		  
		  Time_Container1.Clock1.Invalidate
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Calendar_Container1
	#tag Event
		Sub SelectedDate(inSelectedDate as Date)
		  // Use this Event to push the user's "Selected Date" to anywhere in your code.
		  // IE.   FutureScheduleAssessment_Class.FutureScheduleAssessmentDate = inSelectedDate
		  
		  // Demo Purposes
		  //MsgBox "Selected Date: " + inSelectedDate.ShortDate
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Time_Container1
	#tag Event
		Sub SelectedTime(inHours as String, inMinutes as String, inAMPM as String)
		  // I decided to send the selected Time in separate string parts to allow for maximum control on formating.
		  
		  // My example Format shows a format (without quotes):     "hh:MM AM/PM"
		  
		  // Demo Purposes
		  //Dim TmpDateFormatString as String = inHours+":"+inMinutes+" "+inAMPM
		  //MsgBox "Selected Time: " + TmpDateFormatString
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="AcceptFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AcceptTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Appearance"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BothPickers"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CalendarPicker_Only"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HelpTag"
		Visible=true
		Group="Appearance"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Group="Position"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="SelectClockFaceType"
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TimePicker_Only"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="UseFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
