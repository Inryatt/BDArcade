<Serializable()> Public Class Publisher
    Private _pubID As String
    Private _pubName As String
    Private _pubLocation As String
    Private _pubIsIndie As String

    Property pubID As String
        Get
            Return _pubID
        End Get
        Set(ByVal value As String)
            _pubID = value
        End Set
    End Property

    Property pubName As String
        Get
            Return _pubName
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Game ID field can’t be empty")
                Exit Property
            End If
            _pubName = value
        End Set
    End Property
    Property pubLocation As String
        Get
            Return _pubLocation
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Supplier NIF field can’t be empty")
                Exit Property
            End If
            _pubLocation = value
        End Set
    End Property

    Property pubIsIndie As String
        Get
            Return _pubIsIndie
        End Get
        Set(ByVal value As String)

            Console.WriteLine("value:" + value)
            _pubIsIndie = value

        End Set
    End Property

    Overrides Function ToString() As String
        Return _pubName
    End Function

    Public Sub New()
        MyBase.New()
    End Sub

End Class