Imports System.Data.SqlClient


Public Class Form1
    Dim CN As SqlConnection = New SqlConnection("data source=tcp: mednat.ieeta.pt\ SQLSERVER, 8101;Persist Security Info=True;User ID=p9g9;Password=1745748362@BD;initial catalog=p9g9")
    Dim CMD As SqlCommand
    Dim currentSupplier As Integer
    Dim currentGame As Integer
    Dim currentPublisher As Integer
    Dim currentGameMachine As Integer
    Dim currentMachine As Integer
    Dim currentStore As Integer
    Dim currentStoreID As Integer
    Dim currentEmployee As Integer
    Dim editing As Boolean
    Dim adding As Boolean


    Private Sub GameListBox_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GameListBox.SelectedIndexChanged
        GameCancelButton_Click(Nothing, Nothing)
        If GameListBox.SelectedIndex > -1 Then
            currentGame = GameListBox.SelectedIndex
            ShowGame()
        End If
    End Sub

    Private Sub GameMachinesListBox_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GameMachinesListBox.SelectedIndexChanged
        GameMachineCancelButton_Click(Nothing, Nothing)
        If GameMachinesListBox.SelectedIndex > -1 Then
            currentGameMachine = GameMachinesListBox.SelectedIndex
            ShowGameMachine()
        End If
    End Sub

    Private Sub StoreListBox_SelectedIndexChanged(sender As Object, e As EventArgs) Handles StoreListBox.SelectedIndexChanged
        StoreCancelButton_Click(Nothing, Nothing)

        If StoreListBox.SelectedIndex > -1 Then
            currentStore = StoreListBox.SelectedIndex

            EmployeeLoad(StoreListBox.Items(currentStore).storeID)
            ShowEmployee()
            ShowStore()
        End If
    End Sub
    Private Sub PublisherListBox_SelectedIndexChanged(sender As Object, e As EventArgs) Handles PublisherListBox.SelectedIndexChanged
        PublisherCancelButton_Click(Nothing, Nothing)

        If PublisherListBox.SelectedIndex > -1 Then
            currentPublisher = PublisherListBox.SelectedIndex
            ShowPublisher()
        End If
    End Sub

    Private Sub Supplier_ListBox_SelectedIndexChanged(sender As Object, e As EventArgs) Handles Supplier_ListBox.SelectedIndexChanged
        SupplierCancelEditButton_Click(Nothing, Nothing)

        If Supplier_ListBox.SelectedIndex > -1 Then
            currentSupplier = Supplier_ListBox.SelectedIndex
            ShowSupplier()
        End If
    End Sub
    Private Sub EmployeeListBox_SelectedIndexChanged(sender As Object, e As EventArgs) Handles EmployeeListBox.SelectedIndexChanged
        EmployeeCancelButton_Click(Nothing, Nothing)

        If EmployeeListBox.SelectedIndex > -1 Then
            currentEmployee = EmployeeListBox.SelectedIndex
            ShowEmployee()
        End If
    End Sub
    Public Sub ShowSupplier()
        If Not editing Then
            SupplierCancelEditButton.Hide()
            SupplierSaveButton.Hide()
            SupplierEditButton.Show()
            SupplierEmailInput.Enabled = False
            SupplierNameInput.Enabled = False
            SupplierAddressInput.Enabled = False
            SupplierPhoneInput.Enabled = False
            SupplierNIFInput.Enabled = False

        End If
        If Supplier_ListBox.Items.Count = 0 Or currentSupplier < 0 Then Exit Sub
        Dim supplier As New Supplier
        supplier = CType(Supplier_ListBox.Items.Item(currentSupplier), Supplier)
        SupplierNameInput.Text = supplier.supplierName
        SupplierPhoneInput.Text = Convert.ToInt32(supplier.supplierPhone)
        SupplierEmailInput.Text = supplier.supplierEmail
        SupplierAddressInput.Text = supplier.supplierAddress
        SupplierNIFInput.Text = supplier.supplierNIF
    End Sub

    Public Sub ShowGame()
        If Not editing Then
            GameCancelButton.Hide()
            GameSaveButton.Hide()
            GameEditButton.Show()
            GameIDInput.Enabled = False
            GameNameInput.Enabled = False
            GameCostInput.Enabled = False
            GamePointsInput.Enabled = False
            GamePublisherInput.Enabled = False
            GamePlayersInput.Enabled = False

        End If
        If GameListBox.Items.Count = 0 Or currentGame < 0 Then Exit Sub
        Dim game As New Game
        game = CType(GameListBox.Items.Item(currentGame), Game)

        GameIDInput.Text = game.gameID
        GameNameInput.Text = game.gameName
        GameCostInput.Text = game.gameCost
        GamePointsInput.Text = game.gamePoints
        GamePublisherInput.Text = game.gamePublisherID
        GamePlayersInput.Text = game.gamePlayers
        GameMachineLoad(Convert.ToInt32(game.gameID))

        CMD = New SqlCommand
        CMD.Connection = CN
        CMD.CommandText = "arcade.getPublisher"
        CMD.CommandType = CommandType.StoredProcedure
        CMD.Parameters.AddWithValue("code", Convert.ToInt32(game.gameID))
        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader
        GamePublisherInput.Items.Clear()

        While RDR.Read
            If RDR.Item("pub") <> "3999 DELETED PUBLISHER" Then
                GamePublisherInput.Items.Add(RDR.Item("pub"))
            End If
        End While
        CN.Close()

    End Sub

    Public Sub ShowStore()
        If Not editing Then
            StoreCancelButton.Hide()
            StoreSaveButton.Hide()
            StoreEditButton.Show()
            StoreIDInput.Enabled = False
            StoreLocationInput.Enabled = False
        End If

        If StoreListBox.Items.Count = 0 Or currentStore < 0 Then Exit Sub
        Dim store As New Store
        store = CType(StoreListBox.Items.Item(currentStore), Store)
        currentStoreID = store.storeID
        StoreIDInput.Text = store.storeID
        StoreLocationInput.Text = store.storeLocation

    End Sub

    Public Sub ShowPublisher()
        If Not editing Then
            PublisherCancelButton.Hide()
            PublisherSaveButton.Hide()
            PublisherEditButton.Show()
            PublisherIDInput.Enabled = False
            PublisherNameInput.Enabled = False
            PublisherLocationInput.Enabled = False
            PublisherIsIndependent.Enabled = False


        End If
        If PublisherListBox.Items.Count = 0 Or currentPublisher < 0 Then Exit Sub
        Dim publisher As New Publisher
        publisher = CType(PublisherListBox.Items.Item(currentPublisher), Publisher)

        PublisherIDInput.Text = publisher.pubID
        PublisherNameInput.Text = publisher.pubName
        PublisherLocationInput.Text = publisher.pubLocation
        PublisherIsIndependent.Checked = publisher.pubIsIndie
        Console.WriteLine(publisher.pubIsIndie)



    End Sub

    Public Sub ShowGameMachine()
        Dim gameMachine As New GameMachine
        gameMachine = CType(GameMachinesListBox.Items.Item(currentGameMachine), GameMachine)

        GameMachineLocationInput.Text = gameMachine.gmStore
        GameMachineSerialInput.Text = gameMachine.gmSerial
        GameMachineManuInput.Text = gameMachine.gmManuf
        GameMachineSupplierInput.Text = gameMachine.gmSupName
        GameMachineSerialInput.Enabled = False
        GameMachineLocationInput.Enabled = False
        GameMachineManuInput.Enabled = False
        GameMachineSupplierInput.Enabled = False
    End Sub

    Public Sub ShowEmployee()
        EmpTaskList.Clear()
        If Not editing Then
            EmployeeCancelButton.Hide()
            EmployeeSaveButton.Hide()
            EmployeeEditButton.Show()
            EmployeeNameInput.Enabled = False
            EmployeeEmailInput.Enabled = False
            EmployeeNIFInput.Enabled = False
            EmployeePhoneInput.Enabled = False
            EmployeeSalaryInput.Enabled = False

        End If

        If EmployeeListBox.Items.Count = 0 Or currentEmployee < 0 Then Exit Sub
        Dim employee As New Employee
        employee = CType(EmployeeListBox.Items.Item(currentEmployee), Employee)
        For Each task In employee._empFunction
            EmpTaskList.Items.Add(task)

        Next

        EmployeeEmailInput.Text = employee.empEmail
        EmployeeNameInput.Text = employee.empName
        EmployeeNIFInput.Text = employee.empNIF
        EmployeePhoneInput.Text = employee.empPhone
        EmployeeSalaryInput.Text = employee.empSalary
        EmployeeStartVal.Text = employee.empStart
        EmployeeEndVal.Text = employee.empEnd
    End Sub

    ''Loads everything :)
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Select Case TabControl.SelectedIndex
            Case 0
                GameLoad()
            Case 1
                PublishersLoad()
            Case 2
                SupplierLoad()
            Case 3
                StoreLoad()
        End Select


    End Sub

    Private Sub SupplierEditButton_Click(sender As Object, e As EventArgs) Handles SupplierEditButton.Click
        If Not editing Then
            editing = True
            SupplierCancelEditButton.Show()
            SupplierSaveButton.Show()
            SupplierEditButton.Hide()
            SupplierEmailInput.Enabled = True
            SupplierNameInput.Enabled = True
            SupplierAddressInput.Enabled = True
            SupplierPhoneInput.Enabled = True
            SupplierNIFInput.Enabled = True

        Else
            SupplierCancelEditButton.Hide()
            SupplierSaveButton.Hide()
            SupplierEditButton.Show()
            editing = False
            SupplierEmailInput.Enabled = False
            SupplierNameInput.Enabled = False
            SupplierAddressInput.Enabled = False
            SupplierPhoneInput.Enabled = False
            SupplierNIFInput.Enabled = False
        End If
    End Sub

    Private Sub SupplierCancelEditButton_Click(sender As Object, e As EventArgs) Handles SupplierCancelEditButton.Click
        SupplierCancelEditButton.Hide()
        SupplierSaveButton.Hide()
        SupplierEditButton.Show()
        editing = False
        SupplierEmailInput.Enabled = False
        SupplierNameInput.Enabled = False
        SupplierAddressInput.Enabled = False
        SupplierPhoneInput.Enabled = False
        SupplierNIFInput.Enabled = False

        If Supplier_ListBox.SelectedIndex > -1 Then
            currentSupplier = Supplier_ListBox.SelectedIndex
            ShowSupplier()
        End If
    End Sub

    Private Sub SupplierSaveButton_Click(sender As Object, e As EventArgs) Handles SupplierSaveButton.Click
        SupplierCancelEditButton.Hide()
        SupplierSaveButton.Hide()
        SupplierEditButton.Show()
        editing = False
        SupplierEmailInput.Enabled = False
        SupplierNameInput.Enabled = False
        SupplierAddressInput.Enabled = False
        SupplierPhoneInput.Enabled = False
        SupplierNIFInput.Enabled = False



        CMD = New SqlCommand
        CMD.Connection = CN
        CMD.CommandText = "arcade.insertSupplier"
        CMD.CommandType = CommandType.StoredProcedure
        CMD.Parameters.AddWithValue("NIF", SupplierNIFInput.Text)
        CMD.Parameters.AddWithValue("email", SupplierEmailInput.Text)
        CMD.Parameters.AddWithValue("phone_no", SupplierPhoneInput.Text)
        CMD.Parameters.AddWithValue("address", SupplierAddressInput.Text)
        CMD.Parameters.AddWithValue("name", SupplierNameInput.Text)

        CN.Open()
        CMD.ExecuteNonQuery()
        CN.Close()
        SupplierLoad()
    End Sub

    Private Sub SupplierAddButton_Click(sender As Object, e As EventArgs) Handles SupplierAddButton.Click
        editing = True
        SupplierCancelEditButton.Show()
        SupplierSaveButton.Show()
        SupplierEditButton.Hide()
        SupplierEmailInput.Enabled = True
        SupplierNameInput.Enabled = True
        SupplierAddressInput.Enabled = True
        SupplierPhoneInput.Enabled = True
        SupplierNIFInput.Enabled = True



        SupplierEmailInput.Text = ""
        SupplierNameInput.Text = ""
        SupplierAddressInput.Text = ""
        SupplierPhoneInput.Text = ""
        SupplierNIFInput.Text = ""


        ''TODO --> Insert the new data into the BD

    End Sub

    Private Sub SupplierDeleteButton_Click(sender As Object, e As EventArgs) Handles SupplierDeleteButton.Click
        CMD = New SqlCommand
        CMD.Connection = CN
        CMD.CommandText = "arcade.deleteSupplier"
        CMD.CommandType = CommandType.StoredProcedure
        CMD.Parameters.AddWithValue("supplierNIF", SupplierNIFInput.Text)

        CN.Open()
        CMD.ExecuteNonQuery()
        CN.Close()
        SupplierLoad()
    End Sub

    Private Sub GameEditButton_Click(sender As Object, e As EventArgs) Handles GameEditButton.Click
        If Not editing Then
            editing = True
            GameCancelButton.Show()
            GameSaveButton.Show()
            GameEditButton.Hide()
            GameIDInput.Enabled = True
            GameNameInput.Enabled = True
            GameCostInput.Enabled = True
            GamePointsInput.Enabled = True
            GamePublisherInput.Enabled = True
            GamePlayersInput.Enabled = True

        Else
            GameCancelButton.Hide()
            GameSaveButton.Hide()
            GameEditButton.Show()
            editing = False
            GameIDInput.Enabled = False
            GameNameInput.Enabled = False
            GameCostInput.Enabled = False
            GamePointsInput.Enabled = False
            GamePublisherInput.Enabled = False
            GamePlayersInput.Enabled = False
        End If
    End Sub

    Private Sub GameSaveButton_Click(sender As Object, e As EventArgs) Handles GameSaveButton.Click
        GameCancelButton.Hide()
        GameSaveButton.Hide()
        GameEditButton.Show()
        editing = False
        GameIDInput.Enabled = False
        GameNameInput.Enabled = False
        GameCostInput.Enabled = False
        GamePointsInput.Enabled = False
        GamePublisherInput.Enabled = False
        GamePlayersInput.Enabled = False


        Dim line As String = GameIDInput.Text
        Dim result() As String
        result = line.Split(" ")
        Dim actualid As String = result(0)

        CMD = New SqlCommand
        CMD.Connection = CN
        CMD.CommandText = "arcade.insertGame"
        CMD.CommandType = CommandType.StoredProcedure
        CMD.Parameters.AddWithValue("id", GameIDInput.Text)
        CMD.Parameters.AddWithValue("name", GameNameInput.Text)
        CMD.Parameters.AddWithValue("publisher", actualid)
        CMD.Parameters.AddWithValue("point_value", Integer.Parse(GamePointsInput.Text))
        CMD.Parameters.AddWithValue("credit_cost", Integer.Parse(GameCostInput.Text))
        CMD.Parameters.AddWithValue("no_players", Integer.Parse(GamePlayersInput.Text))



        CN.Open()
        CMD.ExecuteNonQuery()
        CN.Close()

    End Sub

    Private Sub GameAddButton_Click(sender As Object, e As EventArgs) Handles GameAddButton.Click
        editing = True
        GameCancelButton.Show()
        GameSaveButton.Show()
        GameEditButton.Hide()
        GameIDInput.Enabled = True
        GameNameInput.Enabled = True
        GameCostInput.Enabled = True
        GamePointsInput.Enabled = True
        GamePublisherInput.Enabled = True
        GamePlayersInput.Enabled = True



        Dim biggestID As Integer = 0
        For Each gam In GameListBox.Items
            If Integer.Parse(gam.gameID) > biggestID Then
                biggestID = Integer.Parse(gam.gameID)
            End If
        Next
        biggestID = biggestID + 1
        GameIDInput.Text = biggestID
        GameNameInput.Text = ""
        GameCostInput.Text = ""
        GamePointsInput.Text = ""
        GamePublisherInput.Text = ""
        GamePlayersInput.Text = ""
        ''TODO --> Insert the new data into the BD


    End Sub
    Private Sub GameCancelButton_Click(sender As Object, e As EventArgs) Handles GameCancelButton.Click
        GameCancelButton.Hide()
        GameSaveButton.Hide()
        GameEditButton.Show()
        editing = False
        GameIDInput.Enabled = False
        GameNameInput.Enabled = False
        GameCostInput.Enabled = False
        GamePointsInput.Enabled = False
        GamePublisherInput.Enabled = False
        GamePlayersInput.Enabled = False

        If GameListBox.SelectedIndex > -1 Then
            currentGame = GameListBox.SelectedIndex
            ShowGame()
        End If
    End Sub

    Private Sub GameMachineEditButton_Click(sender As Object, e As EventArgs) Handles GameMachineEditButton.Click
        If Not editing Then
            editing = True
            GameMachineCancelButton.Show()
            GameMachineSaveButton.Show()
            GameMachineEditButton.Hide()
            GameMachineSerialInput.Enabled = True
            GameMachineLocationInput.Enabled = True
            GameMachineManuInput.Enabled = True
            GameMachineSupplierInput.Enabled = True

        Else
            GameMachineCancelButton.Hide()
            GameMachineSaveButton.Hide()
            GameMachineEditButton.Show()
            editing = False
            GameMachineSerialInput.Enabled = False
            GameMachineLocationInput.Enabled = False
            GameMachineManuInput.Enabled = False
            GameMachineSupplierInput.Enabled = False

        End If
    End Sub
    Private Sub GameMachineCancelButton_Click(sender As Object, e As EventArgs) Handles GameMachineCancelButton.Click
        GameMachineCancelButton.Hide()
        GameMachineSaveButton.Hide()
        GameMachineEditButton.Show()
        editing = False
        GameMachineSerialInput.Enabled = False
        GameMachineLocationInput.Enabled = False
        GameMachineManuInput.Enabled = False
        GameMachineSupplierInput.Enabled = False

        If GameMachinesListBox.SelectedIndex > -1 Then
            currentGameMachine = GameMachinesListBox.SelectedIndex
            ShowGameMachine()
        End If
    End Sub

    Private Sub GameMachineSaveButton_Click(sender As Object, e As EventArgs) Handles GameMachineSaveButton.Click
        GameMachineCancelButton.Hide()
        GameMachineSaveButton.Hide()
        GameMachineEditButton.Show()
        editing = False
        GameMachineSerialInput.Enabled = False
        GameMachineLocationInput.Enabled = False
        GameMachineManuInput.Enabled = False
        GameMachineSupplierInput.Enabled = False

        If GameMachinesListBox.SelectedIndex > -1 Then
            currentGameMachine = GameMachinesListBox.SelectedIndex
            ShowGameMachine()
        End If


        CMD = New SqlCommand
        CMD.Connection = CN
        CMD.CommandText = "arcade.insertMachine"
        CMD.CommandType = CommandType.StoredProcedure
        CMD.Parameters.AddWithValue("serial_no", Integer.Parse(GameMachineSerialInput.Text))

        CMD.Parameters.AddWithValue("manufacturer", GameMachineManuInput.Text)
        CMD.Parameters.AddWithValue("supplier", GameMachineSupplierInput.Text)
        CMD.Parameters.AddWithValue("game", GameNameInput.Text)
        CMD.Parameters.AddWithValue("store", GameMachineLocationInput.Text)
        CMD.Parameters.AddWithValue("rent_cost", SupplierNameInput.Text)

        CN.Open()
        CMD.ExecuteNonQuery()
        CN.Close()

        ''todo - save changes via SP
    End Sub
    Private Sub PublisherEditButton_Click(sender As Object, e As EventArgs) Handles PublisherEditButton.Click
        editing = True
        PublisherCancelButton.Show()
        PublisherSaveButton.Show()
        PublisherEditButton.Hide()
        PublisherIDInput.Enabled = True
        PublisherNameInput.Enabled = True
        PublisherIsIndependent.Enabled = True
        PublisherLocationInput.Enabled = True


    End Sub

    Private Sub PublisherSaveButton_Click(sender As Object, e As EventArgs) Handles PublisherSaveButton.Click
        If editing Then

            PublisherCancelButton.Hide()
            PublisherSaveButton.Hide()
            PublisherEditButton.Show()
            editing = False
            PublisherIDInput.Enabled = False
            PublisherNameInput.Enabled = False
            PublisherIsIndependent.Enabled = False
            PublisherLocationInput.Enabled = False

        End If

        If adding Then
            PublisherCancelButton.Hide()
            PublisherSaveButton.Hide()
            PublisherEditButton.Show()
            adding = False
            PublisherIDInput.Enabled = False
            PublisherNameInput.Enabled = False
            PublisherIsIndependent.Enabled = False
            PublisherLocationInput.Enabled = False
            PublisherLocationInput.Enabled = False


            CMD = New SqlCommand
            CMD.Connection = CN
            CMD.CommandText = "arcade.insertPublisher"
            CMD.CommandType = CommandType.StoredProcedure
            CMD.Parameters.AddWithValue("id", PublisherIDInput.Text)
            CMD.Parameters.AddWithValue("name", PublisherNameInput.Text)
            CMD.Parameters.AddWithValue("location", PublisherLocationInput.Text)
            If PublisherIsIndependent.Checked Then
                CMD.Parameters.AddWithValue("indie", 1)
            Else
                CMD.Parameters.AddWithValue("indie", 0)
            End If

            CN.Open()
            CMD.ExecuteNonQuery()
            CN.Close()
            PublishersLoad()
        End If

    End Sub

    Private Sub PublisherAddButton_Click(sender As Object, e As EventArgs) Handles PublisherAddButton.Click
        adding = True
        PublisherCancelButton.Show()
        PublisherSaveButton.Show()
        PublisherEditButton.Hide()
        PublisherIDInput.Enabled = True
        PublisherNameInput.Enabled = True
        PublisherIsIndependent.Enabled = True
        PublisherLocationInput.Enabled = True


        PublisherIDInput.Text = ""
        PublisherNameInput.Text = ""
        PublisherLocationInput.Text = ""
        PublisherIsIndependent.Checked = False
        PublisherLocationInput.Text = ""

        ''TODO --> Insert the new data into the BD

    End Sub



    Private Sub PublisherCancelButton_Click(sender As Object, e As EventArgs) Handles PublisherCancelButton.Click
        PublisherCancelButton.Hide()
        PublisherSaveButton.Hide()
        PublisherEditButton.Show()
        editing = False
        PublisherIDInput.Enabled = False
        PublisherNameInput.Enabled = False
        PublisherIsIndependent.Enabled = False


        If PublisherListBox.SelectedIndex > -1 Then
            currentPublisher = PublisherListBox.SelectedIndex
            ShowPublisher()
        End If
    End Sub

    Public Sub SupplierLoad()

        CMD = New SqlCommand

        CMD.Connection = CN
        CMD.CommandText = "SELECT * FROM arcade.Supplier"

        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader
        Supplier_ListBox.Items.Clear()
        While RDR.Read
            Dim S As New Supplier

            If Not RDR.Item("sup_name").Equals(DBNull.Value) Then
                S.supplierName = RDR.Item("sup_name")
                S.supplierPhone = RDR.Item("phone_no")
                S.supplierNIF = RDR.Item("NIF")
                S.supplierEmail = RDR.Item("email")
                S.supplierAddress = RDR.Item("sup_address")



                Supplier_ListBox.Items.Add(S)
            End If
        End While
        CN.Close()
        currentSupplier = 0
        ShowSupplier()
    End Sub
    Public Sub PublishersLoad()
        '' Change this line...

        CMD = New SqlCommand

        CMD.Connection = CN
        CMD.CommandText = "SELECT * FROM arcade.Publisher"

        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader
        PublisherListBox.Items.Clear()
        While RDR.Read
            Dim P As New Publisher

            If Not RDR.Item("pub_location").Equals(DBNull.Value) Then
                P.pubName = RDR.Item("pub_name")
                P.pubID = RDR.Item("pub_id")
                P.pubLocation = RDR.Item("pub_location")
                P.pubIsIndie = RDR.Item("is_indie")


                PublisherListBox.Items.Add(P)
            End If
        End While
        CN.Close()
        currentPublisher = 0
        ShowPublisher()
    End Sub
    Public Sub GameLoad()

        CMD = New SqlCommand

        CMD.Connection = CN
        CMD.CommandText = "SELECT * FROM arcade.Game" ''replace

        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader
        Supplier_ListBox.Items.Clear()
        While RDR.Read
            Dim G As New Game


            If Not RDR.Item("game_name").Equals("[deleted]") Then
                G.gameName = RDR.Item("game_name")
                G.gameID = RDR.Item("game_id")
                G.gameCost = RDR.Item("credit_cost")
                G.gamePlayers = RDR.Item("no_players")
                G.gamePoints = RDR.Item("point_value")
                G.gamePublisherID = RDR.Item("publisher_id")

                GameListBox.Items.Add(G)
            End If
        End While
        CN.Close()

        currentGame = 0
        ShowGame()
    End Sub

    Private Sub GameMachineLoad(gameID As Integer)
        CMD.Connection = CN
        CMD.Parameters.Clear()
        CMD.CommandText = "arcade.game_machines"
        CMD.CommandType = CommandType.StoredProcedure
        CMD.Parameters.AddWithValue("game", gameID)
        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader

        Dim MachineSerials(50) As String
        Dim i As Integer = 0
        While RDR.Read

            MachineSerials(i) = RDR.Item("serial_no")
            i = i + 1

        End While
        CN.Close()
        ReDim Preserve MachineSerials(i)
        i = 0
        CMD.CommandText = "arcade.machine_list"
        CMD.CommandType = CommandType.StoredProcedure
        CMD.Parameters.Clear()
        CN.Open()

        RDR = CMD.ExecuteReader
        GameMachinesListBox.Items.Clear()

        While i < MachineSerials.Length - 1
            RDR.Close()
            RDR = CMD.ExecuteReader
            While RDR.Read
                ''Print(RDR.Item("serial_no"))
                ''Print(CStr(MachineSerials(i)))

                If RDR.Item("serial_no") Like CStr(MachineSerials(i)) Then
                    Dim G As New GameMachine

                    G.gmGameName = RDR.Item("game_name")
                    G.gmManuf = RDR.Item("manufacturer")
                    G.gmSerial = RDR.Item("serial_no")
                    G.gmStore = RDR.Item("store_location")
                    G.gmSupName = RDR.Item("sup_name")
                    GameMachinesListBox.Items.Add(G)
                    i = i + 1
                    Exit While
                End If
            End While
        End While
        CN.Close()
        currentGameMachine = 0
        ShowGameMachine()


    End Sub

    Private Sub StoreLoad()
        CMD = New SqlCommand
        CMD.Connection = CN
        CMD.CommandText = "select * from arcade.Store"
        CMD.CommandType = CommandType.Text


        ''CMD.Parameters.AddWithValue("game", gameID)
        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader
        StoreListBox.Items.Clear()
        While RDR.Read
            If RDR.Item("store_id") <> "1999" Then ''avoid dummy object
                Dim S As New Store

                S.storeID = RDR.Item("store_id")
                S.storeLocation = RDR.Item("store_location")
                StoreListBox.Items.Add(S)
            End If
        End While
        ''Dim MachineSerials(50) As String
        ''Dim i As Integer = 0

        CN.Close()
        currentStore = 0
        ShowStore()
    End Sub
    Private Sub TabChange(sender As Object, e As EventArgs) Handles TabControl.SelectedIndexChanged
        Select Case TabControl.SelectedIndex
            Case 0
                GameLoad()
            Case 1
                PublishersLoad()
            Case 2
                SupplierLoad()
            Case 3
                StoreLoad()
        End Select


    End Sub

    Private Sub StoreEditButton_Click(sender As Object, e As EventArgs) Handles StoreEditButton.Click
        If Not editing Then
            editing = True
            StoreCancelButton.Show()
            StoreSaveButton.Show()
            StoreEditButton.Hide()
            StoreIDInput.Enabled = True
            StoreLocationInput.Enabled = True


        Else
            editing = True
            StoreCancelButton.Show()
            StoreSaveButton.Show()
            StoreEditButton.Hide()
            StoreIDInput.Enabled = True
            StoreLocationInput.Enabled = True


        End If
    End Sub

    Private Sub StoreCancelButton_Click(sender As Object, e As EventArgs) Handles StoreCancelButton.Click
        editing = False
        StoreCancelButton.Hide()
        StoreSaveButton.Hide()
        StoreEditButton.Show()
        StoreAddButton.Show()
        StoreDeleteButton.Show()
        StoreIDInput.Enabled = False
        StoreLocationInput.Enabled = False

        If StoreListBox.SelectedIndex > -1 Then
            currentStore = StoreListBox.SelectedIndex
            ShowStore()
        End If
    End Sub


    Private Sub StoreAddButton_Click(sender As Object, e As EventArgs) Handles StoreAddButton.Click
        editing = True
        StoreCancelButton.Show()
        StoreSaveButton.Show()
        StoreEditButton.Hide()
        StoreAddButton.Hide()
        StoreDeleteButton.Hide()
        StoreIDInput.Enabled = True
        StoreLocationInput.Enabled = True


        StoreIDInput.Text = ""
        StoreLocationInput.Text = ""
    End Sub

    Private Sub StoreDeleteButton_Click(sender As Object, e As EventArgs) Handles StoreDeleteButton.Click
        editing = True
        StoreCancelButton.Hide()
        StoreSaveButton.Hide()
        StoreEditButton.Show()
        StoreIDInput.Enabled = False
        StoreLocationInput.Enabled = False
    End Sub

    Private Sub StoreSaveButton_Click(sender As Object, e As EventArgs) Handles StoreSaveButton.Click
        editing = True
        StoreCancelButton.Hide()
        StoreSaveButton.Hide()
        StoreEditButton.Show()
        StoreAddButton.Show()
        StoreDeleteButton.Show()
        StoreIDInput.Enabled = False
        StoreLocationInput.Enabled = False

    End Sub

    Private Sub EmployeeEditButton_Click(sender As Object, e As EventArgs) Handles EmployeeEditButton.Click
        If Not editing Then
            editing = True
            EmployeeCancelButton.Show()
            EmployeeSaveButton.Show()
            EmployeeEditButton.Hide()
            EmployeeNameInput.Enabled = True
            EmployeeEmailInput.Enabled = True
            EmployeePhoneInput.Enabled = True
            EmployeeNIFInput.Enabled = False
            EmployeeSalaryInput.Enabled = True


        Else
            editing = True
            EmployeeCancelButton.Show()
            EmployeeSaveButton.Show()
            EmployeeEditButton.Hide()
            EmployeeNameInput.Enabled = True
            EmployeeEmailInput.Enabled = True
            EmployeePhoneInput.Enabled = True
            EmployeeNIFInput.Enabled = False
            EmployeeSalaryInput.Enabled = True


        End If
    End Sub

    Private Sub EmployeeCancelButton_Click(sender As Object, e As EventArgs) Handles EmployeeCancelButton.Click
        editing = False
        EmployeeCancelButton.Hide()
        EmployeeSaveButton.Hide()
        EmployeeEditButton.Show()
        EmployeeNameInput.Enabled = False
        EmployeeEmailInput.Enabled = False
        EmployeePhoneInput.Enabled = False
        EmployeeNIFInput.Enabled = False
        EmployeeSalaryInput.Enabled = False

        If EmployeeListBox.SelectedIndex > -1 Then
            currentEmployee = EmployeeListBox.SelectedIndex
            ShowEmployee()
        End If
    End Sub

    Private Sub EmployeeSaveButton_Click(sender As Object, e As EventArgs) Handles EmployeeSaveButton.Click
        editing = False
        EmployeeCancelButton.Hide()
        EmployeeSaveButton.Hide()
        EmployeeEditButton.Show()
        EmployeeNameInput.Enabled = False
        EmployeeEmailInput.Enabled = False
        EmployeePhoneInput.Enabled = False
        EmployeeNIFInput.Enabled = False
        EmployeeSalaryInput.Enabled = False
    End Sub

    Private Sub EmployeeDeleteButton_Click(sender As Object, e As EventArgs) Handles EmployeeDeleteButton.Click

    End Sub

    Private Sub EmployeeAddButton_Click(sender As Object, e As EventArgs) Handles EmployeeAddButton.Click
        editing = True
        EmployeeCancelButton.Show()
        EmployeeSaveButton.Show()
        EmployeeEditButton.Hide()
        EmployeeNameInput.Enabled = True
        EmployeeEmailInput.Enabled = True
        EmployeePhoneInput.Enabled = True
        EmployeeNIFInput.Enabled = True
        EmployeeSalaryInput.Enabled = True

        EmployeeNameInput.Text = ""
        EmployeeEmailInput.Text = ""
        EmployeePhoneInput.Text = ""
        EmployeeNIFInput.Text = ""
        EmployeeSalaryInput.Text = ""
    End Sub

    Private Sub EmployeeLoad(storeID As Integer)
        CMD = New SqlCommand
        CMD.Connection = CN
        CMD.CommandText = "arcade.getEmployees"
        CMD.CommandType = CommandType.StoredProcedure
        CMD.Parameters.AddWithValue("store", storeID)
        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader
        EmployeeListBox.Items.Clear()
        While RDR.Read

            If Not RDR.Item("email").Equals(DBNull.Value) Then

                Dim E As New Employee
                E.empNo = RDR.Item("emp_no")
                E.empName = RDR.Item("emp_name")
                E.empEmail = RDR.Item("email")
                E.empNIF = RDR.Item("NIF")
                E.empPhone = RDR.Item("phone_no")
                E.empSalary = RDR.Item("salary")
                E.empSchedule = RDR.Item("schedule")
                E.empAddress = RDR.Item("emp_address")

                EmployeeListBox.Items.Add(E)
            End If
        End While
        CN.Close()
        RDR.Close()

        ''get schedule details
        For Each E In EmployeeListBox.Items

            CN.Open()
            CMD = New SqlCommand
            CMD.Connection = CN
            CMD.CommandText = "arcade.get_schedule_test"
            CMD.CommandType = CommandType.StoredProcedure

            Dim code = New SqlParameter()
            code.ParameterName = "@code"
            code.SqlDbType = SqlDbType.Int
            code.Direction = ParameterDirection.Input
            code.Value = E.empSchedule
            CMD.Parameters.Add(code)

            ''Console.WriteLine("empno:")
            ''Console.WriteLine(code.Value)

            Dim start = New SqlParameter()
            start.ParameterName = "@starttime"
            start.SqlDbType = SqlDbType.Time
            start.Direction = ParameterDirection.Output
            CMD.Parameters.Add(start)

            Dim endt = New SqlParameter()
            endt.ParameterName = "@endtime"
            endt.SqlDbType = SqlDbType.Time
            endt.Direction = ParameterDirection.Output
            CMD.Parameters.Add(endt)
            'CMD.Parameters.AddWithValue("@code", Convert.ToInt32(E.empSchedule))

            CMD.ExecuteNonQuery()
            E.empStart = start.Value.ToString
            '' start.Value.ToString ''  ("@starttime").Value.ToString()
            E.empEnd = endt.Value.ToString
            ''endt.Value.ToString
            RDR.Close()
            CMD.Parameters.Clear()
            CMD.CommandText = "arcade.getTask"
            CMD.CommandType = CommandType.StoredProcedure
            Dim schcode = New SqlParameter()
            schcode.ParameterName = "@code"
            schcode.Direction = ParameterDirection.Input
            schcode.SqlDbType = SqlDbType.Int
            schcode.Value = Int32.Parse(E.empSchedule)
            CMD.Parameters.Add(schcode)



            RDR = CMD.ExecuteReader
            Dim c As Integer = 0

            While RDR.Read

                E._empFunction(c) = RDR.Item("task")
                c = c + 1
            End While


            CN.Close()
        Next



        currentEmployee = 0
        ShowEmployee()
    End Sub

    Private Sub GameMachineShowAll_Click(sender As Object, e As EventArgs) Handles GameMachineShowAll.Click
        CMD = New SqlCommand
        CMD.Connection = CN
        CMD.CommandText = "arcade.getAllMachines"
        CMD.CommandType = CommandType.StoredProcedure
        CMD.Parameters.Clear()
        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader
        GameMachinesListBox.Items.Clear()
        While RDR.Read

            If Not RDR.Item("serial_no").Equals(0) Then

                Dim G As New GameMachine

                G.gmManuf = RDR.Item("manufacturer")
                G.gmSerial = RDR.Item("serial_no")
                G.gmStore = RDR.Item("store_id")
                G.gmSupName = RDR.Item("sup_name")
                GameMachinesListBox.Items.Add(G)

            End If
        End While
        CN.Close()
        RDR.Close()

        ShowGameMachine()
    End Sub
End Class


