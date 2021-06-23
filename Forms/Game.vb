<Serializable()> Public Class Game
    Private _gameName As String
    Private _gameID As String
    Private _gamePublisherID As String
    Private _gamePoints As String
    Private _gameCost As String
    Private _gamePlayers As String

    Property gameName As String
        Get
            Return _gameName
        End Get
        Set(ByVal value As String)
            _gameName = value
        End Set
    End Property

    Property gameID As String
        Get
            Return _gameID
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Game ID field can’t be empty")
                Exit Property
            End If
            _gameID = value
        End Set
    End Property
    Property gamePublisherID As String
        Get
            Return _gamePublisherID
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Supplier NIF field can’t be empty")
                Exit Property
            End If
            _gamePublisherID = value
        End Set
    End Property
    Property gamePoints As String
        Get
            Return _gamePoints
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Supplier Phone field can’t be empty")
                Exit Property
            End If
            _gamePoints = value
        End Set
    End Property
    Property gameCost As String
        Get
            Return _gameCost
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Supplier Phone field can’t be empty")
                Exit Property
            End If
            _gameCost = value
        End Set
    End Property

    Property gamePlayers As String
        Get
            Return _gamePlayers
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Supplier Phone field can’t be empty")
                Exit Property
            End If
            _gamePlayers = value
        End Set
    End Property
    Overrides Function ToString() As String
        Return _gameName
    End Function

    Public Sub New()
        MyBase.New()
    End Sub

    Public Sub New(ByVal gameID As String,
               ByVal gamePubID As String)
        MyBase.New()
        Me._gameID = gameID
        Me._gamePublisherID = gamePubID
    End Sub




End Class
