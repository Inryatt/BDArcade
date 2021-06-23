<Serializable()> Public Class GameMachine
    Private _gmSerial As String
    Private _gmManufacturer As String
    Private _gmSupName As String
    Private _gmGameName As String
    Private _gmStore As String

    Property gmSerial As String
        Get
            Return _gmSerial
        End Get
        Set(ByVal value As String)
            _gmSerial = value
        End Set
    End Property

    Property gmManuf As String
        Get
            Return _gmManufacturer
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Game ID field can’t be empty")
                Exit Property
            End If
            _gmManufacturer = value
        End Set
    End Property
    Property gmSupName As String
        Get
            Return _gmSupName
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Supplier NIF field can’t be empty")
                Exit Property
            End If
            _gmSupName = value
        End Set
    End Property
    Property gmGameName As String
        Get
            Return _gmGameName
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Supplier Phone field can’t be empty")
                Exit Property
            End If
            _gmGameName = value
        End Set
    End Property
    Property gmStore As String
        Get
            Return _gmStore
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Supplier Phone field can’t be empty")
                Exit Property
            End If
            _gmStore = value
        End Set
    End Property

    Overrides Function ToString() As String
        Return _gmSerial + " " + _gmManufacturer
    End Function

    Public Sub New()
        MyBase.New()
    End Sub


End Class
