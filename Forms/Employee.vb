<Serializable> Public Class Employee
    Private _empNo As String
    Private _empName As String
    Private _empAddress As String
    Private _empEmail As String
    Private _empSalary As String
    Private _empPhone As String
    Private _empNIF As String
    Private _empSchedule As String
    Private _empStart As String
    Private _empEnd As String
    Private _empStore As String
    Private _empStoreName As String
    Public _empFunction(10) As String

    Property empNo As String
        Get
            Return _empNo
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Employee id field can’t be empty")
                Exit Property
            End If
            _empNo = value
        End Set
    End Property
    Property empFun As String()
        Get
            Return _empFunction
        End Get
        Set(ByVal value As String())
            _empFunction = value
        End Set
    End Property

    Property empName As String
        Get
            Return _empName
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Employee name field can’t be empty")
                Exit Property
            End If
            _empName = value
        End Set
    End Property

    Property empAddress As String
        Get
            Return _empAddress
        End Get
        Set(ByVal value As String)

            _empAddress = value
        End Set
    End Property

    Property empEmail As String
        Get
            Return _empEmail
        End Get
        Set(ByVal value As String)
            _empEmail = value
        End Set
    End Property

    Property empSalary As String
        Get
            Return _empSalary
        End Get
        Set(ByVal value As String)
            _empSalary = value
        End Set
    End Property
    Property empPhone As String
        Get
            Return _empPhone
        End Get
        Set(ByVal value As String)
            _empPhone = value
        End Set
    End Property
    Property empNIF As String
        Get
            Return _empNIF
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Employee NIF field can’t be empty")
                Exit Property
            End If
            _empNIF = value
        End Set
    End Property
    Property empSchedule As String
        Get
            Return _empSchedule
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Supplier Schedule field can’t be empty")
                Exit Property
            End If
            _empSchedule = value
        End Set
    End Property
    Property empStart As String
        Get
            Return _empStart
        End Get
        Set(ByVal value As String)
            _empStart = value
        End Set
    End Property
    Property empEnd As String
        Get
            Return _empEnd
        End Get
        Set(ByVal value As String)
            _empEnd = value
        End Set
    End Property
    Property empStoreName As String
        Get
            Return _empStoreName
        End Get
        Set(ByVal value As String)
            _empStoreName = value
        End Set
    End Property

    Overrides Function ToString() As String
        Return empName
    End Function

    Public Sub New()
        MyBase.New()
    End Sub
End Class