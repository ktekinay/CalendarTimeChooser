#tag Class
Protected Class CocoaMenuItemLigatureAll
Inherits CocoaMenuItem
	#tag Event
		Function ActionSelectorName() As String
		  return "useAllLigatures:"
		End Function
	#tag EndEvent


	#tag Constant, Name = LocalizedText, Type = String, Dynamic = True, Default = \"Use All", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Use All"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Alle verwenden"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x81\x99\xE3\x81\xB9\xE3\x81\xA6\xE4\xBD\xBF\xE7\x94\xA8"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Tout utiliser"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Utilizza tutte"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Alle"
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
