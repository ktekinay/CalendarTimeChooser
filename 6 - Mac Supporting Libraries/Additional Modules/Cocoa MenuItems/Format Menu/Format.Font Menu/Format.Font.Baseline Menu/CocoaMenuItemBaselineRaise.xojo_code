#tag Class
Protected Class CocoaMenuItemBaselineRaise
Inherits CocoaMenuItem
	#tag Event
		Function ActionSelectorName() As String
		  return "raiseBaseline:"
		End Function
	#tag EndEvent


	#tag Constant, Name = LocalizedText, Type = String, Dynamic = True, Default = \"Raise", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Raise"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"H\xC3\xB6her"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE4\xB8\x8A\xE3\x81\x92\xE3\x82\x8B"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Relever"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Incrementa"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Omhoog"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
