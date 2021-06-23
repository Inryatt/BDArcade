<Serializable()> Public Class Store
    Private _storeID As String
    Private _storeLocation As String


    Property storeID As String
        Get
            Return _storeID
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Store ID field can’t be empty")
                Exit Property
            End If
            _storeID = value
        End Set
    End Property

    Property storeLocation As String
        Get
            Return _storeLocation
        End Get
        Set(ByVal value As String)

            _storeLocation = value
        End Set
    End Property

    Overrides Function ToString() As String
        Return _storeID + " " + _storeLocation
    End Function

    Public Sub New()
        MyBase.New()
    End Sub

End Class
