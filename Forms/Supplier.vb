<Serializable()> Public Class Supplier
    Private _supplierName As String
    Private _supplierNIF As String
    Private _supplierPhone As String
    Private _supplierEmail As String
    Private _supplierAddress As String

    Property supplierName As String
        Get
            Return _supplierName
        End Get
        Set(ByVal value As String)
            _supplierName = value
        End Set
    End Property

    Property supplierNIF As String
        Get
            Return _supplierNIF
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Supplier NIF field can’t be empty")
                Exit Property
            End If
            _supplierNIF = value
        End Set
    End Property
    Property supplierPhone As String
        Get
            Return _supplierPhone
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Supplier Phone field can’t be empty")
                Exit Property
            End If
            _supplierPhone = value
        End Set
    End Property
    Property supplierEmail As String
        Get
            Return _supplierEmail
        End Get
        Set(ByVal value As String)
            _supplierEmail = value
        End Set
    End Property
    Property supplierAddress As String
        Get
            Return _supplierAddress
        End Get
        Set(ByVal value As String)
            _supplierAddress = value
        End Set
    End Property
    Overrides Function ToString() As String
        Return _supplierName & " - " & _supplierNIF
    End Function

    Public Sub New()
        MyBase.New()
    End Sub
    Public Sub New(ByVal SupplierPhone As String,
               ByVal SupplierNIF As String)
        MyBase.New()
        Me._supplierPhone = SupplierPhone
        Me._supplierNIF = SupplierNIF
    End Sub




End Class
