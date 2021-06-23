<Serializable()> Public Class GameMachine
    Private _gmSerial As String
    Private _gmManufacturer As String
    Private _gmSupName As String
    Private _gmGameName As String
    Private _gmStore As String
    Private _gmRent As String
    Private _gmRentDur As String
    Private _gmStoreId As String
    Private _gmNameId As Integer
    Private _gmCode As String
    Property gmSerial As String
        Get
            Return _gmSerial
        End Get
        Set(ByVal value As String)
            _gmSerial = value
        End Set
    End Property

    Property gmCode As String
        Get
            Return _gmCode
        End Get
        Set(ByVal value As String)
            _gmCode = value
        End Set
    End Property


    Property gmNameId As String
        Get
            Return _gmNameId
        End Get
        Set(ByVal value As String)
            _gmNameId = value
        End Set
    End Property

    Property gmStoreId As String
        Get
            Return _gmStoreId
        End Get
        Set(ByVal value As String)
            _gmStoreId = value
        End Set
    End Property

    Property gmRent As String
        Get
            Return _gmRent
        End Get
        Set(ByVal value As String)
            _gmRent = value
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
