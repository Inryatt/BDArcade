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
    Dim currentControlEmployee As Integer
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
        ''GameMachineCancelButton_Click(Nothing, Nothing)
        ''If GameMachinesListBox.SelectedIndex > -1 Then
        '' currentGameMachine = GameMachinesListBox.SelectedIndex
        '' ShowGameMachine()
        '' End If
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
        ''  GameMachineLoad(Convert.ToInt32(game.gameID))

        CMD = New SqlCommand
        CMD.Connection = CN
        CMD.CommandText = "arcade.getPublisher"
        CMD.CommandType = CommandType.StoredProcedure
        CMD.Parameters.AddWithValue("code", Convert.ToInt32(game.gameID))
        CN.Close()

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
        RDR.Close()

        CMD = New SqlCommand
        CMD.Connection = CN
        CMD.CommandText = "arcade.game_machines"
        CMD.CommandType = CommandType.StoredProcedure
        CMD.Parameters.AddWithValue("game", Convert.ToInt32(game.gameID))

        CN.Open()
        RDR = CMD.ExecuteReader
        GameMachinesListBox.Items.Clear()

        While RDR.Read
            GameMachinesListBox.Items.Add(RDR.Item("serial_no"))
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
        GameMachineSupplierInput.Text = gameMachine.gmSerial + " " + gameMachine.gmSupName
        GameMAchineRentInput.Text = gameMachine.gmRent
        GameMachineSerialInput.Enabled = False
        GameMachineLocationInput.Enabled = False
        GameMachineManuInput.Enabled = False
        GameMachineSupplierInput.Enabled = False
        GameMAchineRentInput.Enabled = False


        CMD = New SqlCommand
        CMD.Connection = CN
        CMD.CommandText = "arcade.getSupplier"
        CMD.CommandType = CommandType.StoredProcedure
        CN.Close()
        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader
        GameMachineSupplierInput.Items.Clear()

        While RDR.Read
            If RDR.Item("NIF") <> "000000000" Then
                GameMachineSupplierInput.Items.Add(RDR.Item("NIF") + " " + RDR.Item("sup_name"))
            End If
        End While
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
            EmployeeAddressInput.Enabled = False
            EmployeeScheduleSelect.Enabled = False
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
        EmployeeAddressInput.Text = employee.empAddress
        EmployeeStartVal.Text = employee.empStart
        EmployeeEndVal.Text = employee.empEnd

        For Each sch In EmployeeScheduleSelect.Items
            If sch.ToString().Equals(employee.empSchedule) Then
                EmployeeScheduleSelect.SelectedItem = sch
            End If
        Next
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
            Case 4
                LoadLogs()
            Case 6
                loadcontrol()
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
        SupplierEmailInput.Enabled = False
        SupplierNameInput.Enabled = False
        SupplierAddressInput.Enabled = False
        SupplierPhoneInput.Enabled = False
        SupplierNIFInput.Enabled = False



        CMD = New SqlCommand
        CMD.Connection = CN

        If editing Then
            CMD.CommandText = "arcade.alterSupplier"
            CMD.CommandType = CommandType.StoredProcedure
            CMD.Parameters.AddWithValue("nif", SupplierNIFInput.Text)
            CMD.Parameters.AddWithValue("email", SupplierEmailInput.Text)
            CMD.Parameters.AddWithValue("phone_no", SupplierPhoneInput.Text)
            CMD.Parameters.AddWithValue("address", SupplierAddressInput.Text)
            CMD.Parameters.AddWithValue("name", SupplierNameInput.Text)
        Else
            CMD.CommandText = "arcade.insertSupplier"
            CMD.CommandType = CommandType.StoredProcedure
            CMD.Parameters.AddWithValue("NIF", SupplierNIFInput.Text)
            CMD.Parameters.AddWithValue("email", SupplierEmailInput.Text)
            CMD.Parameters.AddWithValue("phone_no", SupplierPhoneInput.Text)
            CMD.Parameters.AddWithValue("address", SupplierAddressInput.Text)
            CMD.Parameters.AddWithValue("name", SupplierNameInput.Text)
        End If

        editing = False
        adding = False

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
            GameAlterButton.Show()

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
            GameAlterButton.Hide()

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


        Dim line As String = GamePublisherInput.Text
        Dim result() As String
        result = line.Split(" ")
        Dim actualid As String = result(0)

        CMD = New SqlCommand
        CMD.Connection = CN
        CMD.CommandText = "arcade.insertGame"
        CMD.CommandType = CommandType.StoredProcedure
        CMD.Parameters.AddWithValue("id", GameIDInput.Text)
        CMD.Parameters.AddWithValue("name", GameNameInput.Text)
        CMD.Parameters.AddWithValue("publisher", Integer.Parse(actualid))
        CMD.Parameters.AddWithValue("point_value", Integer.Parse(GamePointsInput.Text))
        CMD.Parameters.AddWithValue("credit_cost", Integer.Parse(GameCostInput.Text))
        CMD.Parameters.AddWithValue("no_players", Integer.Parse(GamePlayersInput.Text))

        CN.Open()
        CMD.ExecuteNonQuery()
        CN.Close()
        GameLoad()

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
        GameAlterButton.Hide()



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
        GameAlterButton.Hide()

        If GameListBox.SelectedIndex > -1 Then
            currentGame = GameListBox.SelectedIndex
            ShowGame()
        End If
    End Sub

    Private Sub GameMachineEditButton_Click(sender As Object, e As EventArgs)
        If Not editing Then
            editing = True
            GameMachineCancelButton.Show()
            GameMachineSaveButton.Show()
            GameMachineEditButton.Hide()
            GameMachineSerialInput.Enabled = True
            GameMachineLocationInput.Enabled = True
            GameMachineManuInput.Enabled = True
            GameMachineSupplierInput.Enabled = True
            GameMAchineRentInput.Enabled = True

        Else
            GameMachineCancelButton.Hide()
            GameMachineSaveButton.Hide()
            GameMachineEditButton.Show()
            editing = False
            GameMachineSerialInput.Enabled = False
            GameMachineLocationInput.Enabled = False
            GameMachineManuInput.Enabled = False
            GameMachineSupplierInput.Enabled = False
            GameMAchineRentInput.Enabled = False

        End If
    End Sub
    Private Sub GameMachineCancelButton_Click(sender As Object, e As EventArgs)
        GameMachineCancelButton.Hide()
        GameMachineSaveButton.Hide()
        GameMachineEditButton.Show()
        editing = False
        GameMachineSerialInput.Enabled = False
        GameMachineLocationInput.Enabled = False
        GameMachineManuInput.Enabled = False
        GameMachineSupplierInput.Enabled = False
        GameMAchineRentInput.Enabled = False

        If GameMachinesListBox.SelectedIndex > -1 Then
            currentGameMachine = GameMachinesListBox.SelectedIndex
            ShowGameMachine()
        End If
    End Sub

    Private Sub GameMachineSaveButton_Click(sender As Object, e As EventArgs)
        GameMachineCancelButton.Hide()
        GameMachineSaveButton.Hide()
        GameMachineEditButton.Show()
        editing = False
        GameMachineSerialInput.Enabled = False
        GameMachineLocationInput.Enabled = False
        GameMachineManuInput.Enabled = False
        GameMachineSupplierInput.Enabled = False
        GameMAchineRentInput.Enabled = False


        Dim line As String = GameMachineSupplierInput.Text
        Dim result() As String
        result = line.Split(" ")
        Dim actualid As String = result(0)
        Dim gm As New GameMachine

        gm = CType(GameMachinesListBox.Items.Item(currentGameMachine), GameMachine)
        Console.WriteLine(currentGameMachine)

        CN.Close()
        CMD = New SqlCommand
        CMD.Connection = CN
        CMD.CommandText = "arcade.insertMachine"
        CMD.CommandType = CommandType.StoredProcedure
        CMD.Parameters.AddWithValue("serial_no", Integer.Parse(GameMachineSerialInput.Text))
        CMD.Parameters.AddWithValue("manufacturer", GameMachineManuInput.Text)
        CMD.Parameters.AddWithValue("supplier", Integer.Parse(actualid))
        Console.WriteLine(actualid)
        CMD.Parameters.AddWithValue("game", Integer.Parse(gm.gmNameId))
        CMD.Parameters.AddWithValue("store", Integer.Parse(gm.gmStoreId))
        ''CMD.Parameters.AddWithValue("rent_cost", GameMAchineRentInput.Text)

        CN.Open()
        CMD.ExecuteNonQuery()
        CN.Close()
        Console.WriteLine("he")

        Console.WriteLine(currentGameMachine)

        GameMachineLoad(gm.gmCode)

        If GameMachinesListBox.SelectedIndex > -1 Then
            currentGameMachine = GameMachinesListBox.SelectedIndex
            ShowGameMachine()
        End If


        ''todo - save changes via SP
    End Sub
    Private Sub PublisherEditButton_Click(sender As Object, e As EventArgs) Handles PublisherEditButton.Click
        editing = True
        PublisherCancelButton.Show()
        PublisherSaveButton.Show()
        PublisherEditButton.Hide()
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

            CMD = New SqlCommand
            CMD.Connection = CN
            CMD.CommandText = "arcade.alterPublisher"
            CMD.CommandType = CommandType.StoredProcedure
            CMD.Parameters.AddWithValue("publisher_id", PublisherIDInput.Text)
            CMD.Parameters.AddWithValue("name", PublisherNameInput.Text)
            CMD.Parameters.AddWithValue("location", PublisherLocationInput.Text)
            If PublisherIsIndependent.Checked Then
                CMD.Parameters.AddWithValue("is_indie", 1)
            Else
                CMD.Parameters.AddWithValue("is_indie", 0)
            End If

            CN.Open()
            CMD.ExecuteNonQuery()
            CN.Close()
            PublishersLoad()
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

        Dim biggestID As Integer = 0
        For Each pub In PublisherListBox.Items
            If Integer.Parse(pub.pubID) > biggestID Then
                biggestID = Integer.Parse(pub.pubID)
            End If
        Next
        biggestID = biggestID + 1
        PublisherIDInput.Text = biggestID
        PublisherNameInput.Text = ""
        PublisherLocationInput.Text = ""
        PublisherIsIndependent.Checked = False
        PublisherLocationInput.Text = ""


    End Sub



    Private Sub PublisherCancelButton_Click(sender As Object, e As EventArgs) Handles PublisherCancelButton.Click
        PublisherCancelButton.Hide()
        PublisherSaveButton.Hide()
        PublisherEditButton.Show()
        editing = False
        PublisherIDInput.Enabled = False
        PublisherNameInput.Enabled = False
        PublisherIsIndependent.Enabled = False
        PublisherLocationInput.Enabled = False


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
        GameListBox.Items.Clear()
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
        CN.Close()
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
                    G.gmStoreId = RDR.Item("store_id")
                    G.gmNameId = RDR.Item("game_id")
                    G.gmCode = RDR.Item("Code")
                    '' G.gmRent = RDR.Item("rent")
                    ''G.gmRentDur = RDR.Item("rent:dur")

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
            Case 4
                LoadLogs()
            Case 6
                loadcontrol()

        End Select


    End Sub

    Private Sub LogChange(sender As Object, e As EventArgs)

        Select Case TabControl.SelectedIndex
            Case 0
                Me.RedeemedTableAdapter.Fill(Me.ArcadeData.Redeemed)

            Case 1

                Me.ToppedUpTableAdapter.Fill(Me.ArcadeData.ToppedUp)

            Case 2
                Me.MaintainedTableAdapter.Fill(Me.ArcadeData.Maintained)

            Case 3
                Me.PlayedTableAdapter.Fill(Me.ArcadeData.Played)

        End Select


    End Sub

    Private Sub StoreEditButton_Click(sender As Object, e As EventArgs) Handles StoreEditButton.Click
        If Not editing Then
            editing = True
            StoreCancelButton.Show()
            StoreSaveButton.Show()
            StoreEditButton.Hide()
            StoreIDInput.Enabled = False
            StoreLocationInput.Enabled = True

        Else
            editing = True
            StoreCancelButton.Show()
            StoreSaveButton.Show()
            StoreEditButton.Hide()
            StoreIDInput.Enabled = False
            StoreLocationInput.Enabled = True

        End If
    End Sub

    Private Sub StoreCancelButton_Click(sender As Object, e As EventArgs) Handles StoreCancelButton.Click
        editing = False
        adding = False
        StoreCancelButton.Hide()
        StoreSaveButton.Hide()
        StoreEditButton.Show()
        StoreAddButton.Show()
        StoreIDInput.Enabled = False
        StoreLocationInput.Enabled = False

        If StoreListBox.SelectedIndex > -1 Then
            currentStore = StoreListBox.SelectedIndex
            ShowStore()
        End If
    End Sub


    Private Sub StoreAddButton_Click(sender As Object, e As EventArgs) Handles StoreAddButton.Click
        adding = True
        editing = False
        StoreCancelButton.Show()
        StoreSaveButton.Show()
        StoreEditButton.Hide()
        StoreAddButton.Hide()
        StoreIDInput.Enabled = True
        StoreLocationInput.Enabled = True


        StoreIDInput.Text = ""
        StoreLocationInput.Text = ""
    End Sub


    Private Sub StoreSaveButton_Click(sender As Object, e As EventArgs) Handles StoreSaveButton.Click
        StoreCancelButton.Hide()
        StoreSaveButton.Hide()
        StoreEditButton.Show()
        StoreAddButton.Show()
        StoreIDInput.Enabled = False
        StoreLocationInput.Enabled = False


        CMD = New SqlCommand
        CMD.Connection = CN
        CMD.CommandType = CommandType.StoredProcedure

        If editing Then
            CMD.CommandText = "arcade.alterStore"
        Else
            CMD.CommandText = "arcade.insertStore"
        End If

        CMD.Parameters.AddWithValue("store_id", StoreIDInput.Text)
        CMD.Parameters.AddWithValue("location", StoreLocationInput.Text)

        CN.Open()
        CMD.ExecuteNonQuery()
        CN.Close()

        editing = False
        adding = False
        StoreLoad()
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
            EmployeeAddressInput.Enabled = True
            EmployeeScheduleSelect.Enabled = True

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
            EmployeeAddressInput.Enabled = True
            EmployeeScheduleSelect.Enabled = True

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
        EmployeeAddressInput.Enabled = False
        EmployeeScheduleSelect.Enabled = False


        If EmployeeListBox.SelectedIndex > -1 Then
            currentEmployee = EmployeeListBox.SelectedIndex
            ShowEmployee()
        End If
    End Sub

    Private Sub EmployeeSaveButton_Click(sender As Object, e As EventArgs) Handles EmployeeSaveButton.Click
        EmployeeCancelButton.Hide()
        EmployeeSaveButton.Hide()
        EmployeeEditButton.Show()
        EmployeeNameInput.Enabled = False
        EmployeeEmailInput.Enabled = False
        EmployeePhoneInput.Enabled = False
        EmployeeNIFInput.Enabled = False
        EmployeeSalaryInput.Enabled = False
        EmployeeAddressInput.Enabled = False
        EmployeeScheduleSelect.Enabled = False


        CMD = New SqlCommand
        CMD.Connection = CN

        If editing Then
            CMD.CommandText = "arcade.alterEmployee"
            CMD.CommandType = CommandType.StoredProcedure
            CMD.Parameters.AddWithValue("emp_no", EmployeeListBox.SelectedItem.empNo)
            CMD.Parameters.AddWithValue("name", EmployeeNameInput.Text)
            CMD.Parameters.AddWithValue("email", EmployeeEmailInput.Text)
            CMD.Parameters.AddWithValue("salary", "€" + EmployeeSalaryInput.Text)
            CMD.Parameters.AddWithValue("phone_no", EmployeePhoneInput.Text)
            CMD.Parameters.AddWithValue("address", EmployeeAddressInput.Text)
            CMD.Parameters.AddWithValue("schedule", EmployeeScheduleSelect.SelectedItem.ToString())
        Else
            CMD.CommandText = "arcade.insertEmployee"
            CMD.CommandType = CommandType.StoredProcedure

            Dim biggestID As Integer = 0
            For Each emp In EmployeeListBox.Items
                If Integer.Parse(emp.empNo) > biggestID Then
                    biggestID = Integer.Parse(emp.empNo)
                End If
            Next
            biggestID = biggestID + 1
            CMD.Parameters.AddWithValue("emp_no", biggestID)
            CMD.Parameters.AddWithValue("nif", EmployeeNIFInput.Text)
            CMD.Parameters.AddWithValue("address", EmployeeAddressInput.Text)
            CMD.Parameters.AddWithValue("schedule", EmployeeScheduleSelect.SelectedItem.ToString())
            CMD.Parameters.AddWithValue("name", EmployeeNameInput.Text)
            CMD.Parameters.AddWithValue("email", EmployeeEmailInput.Text)
            CMD.Parameters.AddWithValue("salary", "€" + EmployeeSalaryInput.Text)
            CMD.Parameters.AddWithValue("phone_no", EmployeePhoneInput.Text)
            CMD.Parameters.AddWithValue("store", StoreIDInput.Text)
        End If


        CN.Open()
        CMD.ExecuteNonQuery()
        CN.Close()

        adding = False
        editing = False
        EmployeeLoad(Integer.Parse(StoreIDInput.Text))
    End Sub

    Private Sub EmployeeDeleteButton_Click(sender As Object, e As EventArgs) Handles EmployeeDeleteButton.Click
        CMD = New SqlCommand
        CMD.Connection = CN
        CMD.CommandText = "arcade.deleteEmployee"
        CMD.CommandType = CommandType.StoredProcedure
        CMD.Parameters.AddWithValue("emp_no", EmployeeListBox.SelectedItem.empNo)

        CN.Open()
        CMD.ExecuteNonQuery()
        CN.Close()
        EmployeeLoad(Integer.Parse(StoreIDInput.Text))
        EmployeeListBox.SelectedIndex = 0
    End Sub

    Private Sub EmployeeAddButton_Click(sender As Object, e As EventArgs) Handles EmployeeAddButton.Click
        adding = True
        editing = False
        EmployeeCancelButton.Show()
        EmployeeSaveButton.Show()
        EmployeeEditButton.Hide()
        EmployeeNameInput.Enabled = True
        EmployeeEmailInput.Enabled = True
        EmployeePhoneInput.Enabled = True
        EmployeeNIFInput.Enabled = True
        EmployeeSalaryInput.Enabled = True
        EmployeeAddressInput.Enabled = True
        EmployeeScheduleSelect.Enabled = True

        EmployeeNameInput.Text = ""
        EmployeeEmailInput.Text = ""
        EmployeePhoneInput.Text = ""
        EmployeeNIFInput.Text = ""
        EmployeeSalaryInput.Text = ""
        EmployeeAddressInput.Text = ""
        EmployeeScheduleSelect.SelectedIndex = 0
    End Sub

    Private Sub EmployeeLoad(storeID As Integer)
        Dim RDR As SqlDataReader

        ''get schedule list
        CMD = New SqlCommand
        CMD.Connection = CN
        CMD.CommandText = "arcade.getScheduleCodes"
        CMD.CommandType = CommandType.StoredProcedure
        CN.Open()

        RDR = CMD.ExecuteReader
        EmployeeScheduleSelect.Items.Clear()
        While RDR.Read
            If RDR.Item("schedule_code") <> 8999 Then
                EmployeeScheduleSelect.Items.Add(RDR.Item("schedule_code"))
            End If
        End While
        CN.Close()
        RDR.Close()


        CMD = New SqlCommand
        CMD.Connection = CN
        CMD.CommandText = "arcade.getEmployees"
        CMD.CommandType = CommandType.StoredProcedure
        CMD.Parameters.AddWithValue("store", storeID)
        CN.Open()
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
            CMD.CommandText = "arcade.get_schedule"
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

    Private Sub GameMachineShowAll_Click(sender As Object, e As EventArgs)
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

    Private Sub GameMachineSupplierInput_SelectedIndexChanged(sender As Object, e As EventArgs)
        selectMachineForGame.Show()

        CMD.Parameters.Clear()
        CMD.CommandText = "arcade.getallMachines"
        CMD.CommandType = CommandType.StoredProcedure
        CMD.Parameters.Clear()
        Dim RDR As SqlDataReader

        RDR = CMD.ExecuteReader

        While RDR.Read
            selectMachineForGame.Items.Add(RDR.Item("serial_no"))
        End While


        CN.Close()
    End Sub

    Private Sub addGameToMAchineButton_Click(sender As Object, e As EventArgs) Handles addGameToMAchineButton.Click
        ''   CMD = New SqlCommand
        ''   CMD.Connection = CN
        ''   CMD.CommandText = "arcade.getAllMachines"
        ''   CMD.CommandType = CommandType.StoredProcedure
        ''   CMD.Parameters.Clear()
        ''   CN.Open()
        ''   Dim RDR As SqlDataReader
        ''   RDR = CMD.ExecuteReader
        ''   GameMachinesListBox.Items.Clear()
        ''   While RDR.Read
        ''
        ''       If Not RDR.Item("serial_no").Equals(0) Then
        ''
        ''           Dim G As New GameMachine
        ''
        ''           G.gmManuf = RDR.Item("manufacturer")
        ''           G.gmSerial = RDR.Item("serial_no")
        ''           G.gmStore = RDR.Item("store_id")
        ''           G.gmSupName = RDR.Item("sup_name")
        ''           GameMachinesListBox.Items.Add(G)
        ''
        ''       End If
        ''   End While
        ''   CN.Close()
        ''   RDR.Close()
        ''
        ''   ShowGameMachine()

        selectMachineForGame.Show()
        gameAddSaveMachine.Show()
        removeGamefromMachine.Hide()
        addGameToMAchineButton.Hide()

        CN.Open()
        CMD.Parameters.Clear()
        CMD.CommandText = "arcade.getMachineWithNoGame"
        CMD.CommandType = CommandType.StoredProcedure
        CMD.Parameters.Clear()
        Dim RDR As SqlDataReader

        RDR = CMD.ExecuteReader

        While RDR.Read
            selectMachineForGame.Items.Add(RDR.Item("serial_no"))
            Console.WriteLine("ssfdf")
        End While


        CN.Close()
    End Sub

    Private Sub selectMachineForGame_SelectedIndexChanged(sender As Object, e As EventArgs) Handles selectMachineForGame.SelectedIndexChanged

    End Sub

    Private Sub gameAddSaveMachine_Click(sender As Object, e As EventArgs) Handles gameAddSaveMachine.Click

        CMD.Parameters.Clear()
        CMD.CommandText = "arcade.addGameToMachine"
        CMD.CommandType = CommandType.StoredProcedure
        CMD.Parameters.Clear()
        Dim gm As New Game
        gm = CType(GameListBox.Items.Item(currentGame), Game)
        CN.Open()
        CMD.Parameters.AddWithValue("machine", Integer.Parse(selectMachineForGame.Text))
        CMD.Parameters.AddWithValue("game", Integer.Parse(gm.gameID))

        CMD.ExecuteNonQuery()

        selectMachineForGame.Hide()
        gameAddSaveMachine.Hide()
        removeGamefromMachine.Show()
        addGameToMAchineButton.Show()

        CN.Close()
        GameLoad()
    End Sub

    Private Sub removeGamefromMachine_Click(sender As Object, e As EventArgs) Handles removeGamefromMachine.Click

        CMD.Parameters.Clear()
        CMD.CommandText = "arcade.removeGameFromMachine"
        CMD.CommandType = CommandType.StoredProcedure
        Dim gm As New Game
        gm = CType(GameListBox.Items.Item(currentGame), Game)

        CN.Open()

        Console.WriteLine(GameMachinesListBox.Items(currentMachine))
        CMD.Parameters.AddWithValue("machine", Integer.Parse(GameMachinesListBox.Items(currentMachine)))
        CMD.ExecuteNonQuery()


        CN.Close()

        selectMachineForGame.Hide()
        gameAddSaveMachine.Hide()
        removeGamefromMachine.Show()

        GameLoad()
    End Sub

    Private Sub GameAlterButton_Click(sender As Object, e As EventArgs) Handles GameAlterButton.Click


        Dim line As String = GamePublisherInput.Text
        Dim result() As String
        result = line.Split(" ")
        Dim actualid As String = result(0)

        CMD = New SqlCommand
        CMD.Connection = CN
        CMD.CommandText = "arcade.alterGame"
        CMD.CommandType = CommandType.StoredProcedure
        CMD.Parameters.AddWithValue("game_id", GameIDInput.Text)
        CMD.Parameters.AddWithValue("name", GameNameInput.Text)
        CMD.Parameters.AddWithValue("point_value", Integer.Parse(GamePointsInput.Text))
        CMD.Parameters.AddWithValue("credit_cost", Integer.Parse(GameCostInput.Text))
        CMD.Parameters.AddWithValue("no_players", Integer.Parse(GamePlayersInput.Text))

        CN.Open()
        CMD.ExecuteNonQuery()
        CN.Close()
        GameLoad()
    End Sub

    Private Sub GameDeleteButton_Click(sender As Object, e As EventArgs) Handles GameDeleteButton.Click
        CMD = New SqlCommand
        CMD.Connection = CN
        CMD.CommandText = "arcade.deleteGame"
        CMD.CommandType = CommandType.StoredProcedure
        CMD.Parameters.AddWithValue("game_id", Integer.Parse(GameIDInput.Text))

        CN.Open()
        CMD.ExecuteNonQuery()
        CN.Close()
        GameLoad()
    End Sub


    Private Sub ShowMaintenanceLogs()
        CMD = New SqlCommand

        CMD.Connection = CN
        CMD.CommandText = "arcade.getMaintained"
        CMD.CommandType = CommandType.StoredProcedure

        CN.Open()


        Dim sa As SqlDataAdapter = New SqlDataAdapter(CMD)
        Dim ds As DataSet = New DataSet()


        sa.Fill(ds)
        LogGrid.DataSource = ds.Tables(0)
        CN.Close()


    End Sub
    Private Sub ShowPlayLogs()
        CMD = New SqlCommand

        CMD.Connection = CN
        CMD.CommandText = "arcade.getPlayed"
        CMD.CommandType = CommandType.StoredProcedure

        CN.Open()


        Dim sa As SqlDataAdapter = New SqlDataAdapter(CMD)
        Dim ds As DataSet = New DataSet()


        sa.Fill(ds)
        LogGrid.DataSource = ds.Tables(0)
        CN.Close()

    End Sub
    Private Sub ShowRedeemLogs()
        CMD = New SqlCommand
        CMD.Connection = CN
        CMD.CommandText = "arcade.getRedeemed"
        CMD.CommandType = CommandType.StoredProcedure

        CN.Open()


        Dim sa As SqlDataAdapter = New SqlDataAdapter(CMD)
        Dim ds As DataSet = New DataSet()


        sa.Fill(ds)
        LogGrid.DataSource = ds.Tables(0)
        CN.Close()


    End Sub
    Private Sub ShowTopupLogs()

        CMD.Connection = CN
        CMD.CommandText = "arcade.getTopped"
        CMD.CommandType = CommandType.StoredProcedure

        CN.Open()


        Dim sa As SqlDataAdapter = New SqlDataAdapter(CMD)
        Dim ds As DataSet = New DataSet()


        sa.Fill(ds)
        LogGrid.DataSource = ds.Tables(0)
        CN.Close()


    End Sub

    Private Sub ShowMaintenanceLog_Click(sender As Object, e As EventArgs) Handles ShowMaintenanceLog.Click
        ShowMaintenanceLogs()
    End Sub

    Private Sub RedeemShowLogs_Click(sender As Object, e As EventArgs) Handles RedeemShowLogs.Click
        ShowRedeemLogs()
    End Sub

    Private Sub ShowPlayLog_Click(sender As Object, e As EventArgs) Handles ShowPlayLog.Click
        ShowPlayLogs()
    End Sub

    Private Sub topupShowLogs_Click(sender As Object, e As EventArgs) Handles topupShowLogs.Click
        ShowTopupLogs()
    End Sub

    Private Sub EmployeeLogs_SelectedIndexChanged(sender As Object, e As EventArgs) Handles EmployeeLogs.SelectedIndexChanged
        selectMachineForGame.Show()
        Dim line As String = EmployeeLogs.Text
        Dim result() As String
        result = line.Split(" ")
        Dim actualid As String = result(0)
        Console.WriteLine(actualid)
        CMD.Parameters.Clear()
        CMD.CommandText = "arcade.getAllLogs"
        CMD.Parameters.AddWithValue("@emp", Integer.Parse(actualid))
        CMD.CommandType = CommandType.StoredProcedure
        Dim sa As SqlDataAdapter = New SqlDataAdapter(CMD)
        Dim ds As DataSet = New DataSet()

        CN.Open()
        sa.Fill(ds)
        LogGrid.DataSource = ds.Tables(0)
        CN.Close()


    End Sub

    Private Sub LoadLogs()

        EmployeeLogs.Items.Add("")
        userStat.Items.Add("")

        gameStat.Items.Add("")

        CMD = New SqlCommand
        CMD.Connection = CN

        CMD.Parameters.Clear()
        CMD.CommandText = "arcade.getEMployeeList"
        CMD.CommandType = CommandType.StoredProcedure
        CMD.Parameters.Clear()
        Dim RDR As SqlDataReader

        CN.Open()
        RDR = CMD.ExecuteReader

        While RDR.Read



            EmployeeLogs.Items.Add(RDR.Item("employee"))
        End While
        RDR.Close()

        CMD = New SqlCommand
        CMD.Connection = CN

        CMD.Parameters.Clear()
        CMD.CommandText = "arcade.getUserList"
        CMD.CommandType = CommandType.StoredProcedure
        CMD.Parameters.Clear()

        RDR = CMD.ExecuteReader

        While RDR.Read()

            userStat.Items.Add(RDR.Item("client"))
        End While

        RDR.Close()
        CMD = New SqlCommand
        CMD.Connection = CN

        CMD.Parameters.Clear()
        CMD.CommandText = "arcade.getGameList"
        CMD.CommandType = CommandType.StoredProcedure
        CMD.Parameters.Clear()

        RDR = CMD.ExecuteReader

        While RDR.Read()

            gameStat.Items.Add(RDR.Item("game"))
        End While



        CN.Close()


    End Sub

    Private Sub statisticsButtonGo_Click(sender As Object, e As EventArgs) Handles statisticsButtonGo.Click


        Dim RDR As SqlDataReader

        CMD = New SqlCommand
        CMD.Connection = CN

        CMD.Parameters.Clear()
        CMD.CommandText = "arcade.playtime_stats"
        CMD.CommandType = CommandType.StoredProcedure
        CMD.Parameters.Clear()

        Dim us As String = userStat.Text
        Dim result() As String
        result = us.Split(" ")
        Dim client As String = result(0)

        Dim us2 As String = gameStat.Text
        Dim result2() As String
        result2 = us2.Split(" ")
        Dim game As String = result2(0)
        If client Like "" Then
            CMD.Parameters.AddWithValue("@client", Nothing)
        Else
            CMD.Parameters.AddWithValue("@client", client)

        End If

        If game Like "" Then
        Else
            CMD.Parameters.AddWithValue("@game", game)

        End If

        If statsUseStart.Checked Then
            CMD.Parameters.AddWithValue("@start_date", StartTimeStats.Value)

        End If

        If StatsuseEnd.Checked Then
            CMD.Parameters.AddWithValue("@end_date", EndTimeStats.Value)


        End If

        Dim avg = New SqlParameter()
        avg.ParameterName = "@avg_time"
        avg.SqlDbType = SqlDbType.Time
        avg.Direction = ParameterDirection.Output
        CMD.Parameters.Add(avg)

        Dim endt = New SqlParameter()
        endt.ParameterName = "@total_time"
        endt.SqlDbType = SqlDbType.Time
        endt.Direction = ParameterDirection.Output
        CMD.Parameters.Add(endt)
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
            avgTime.Text = avg.Value.ToString
            totalTime.Text = endt.Value.ToString


        Catch ex As Exception
            MessageBox.Show("No activity found!", "ERROR",
    MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try

        CN.Close()


    End Sub

    Private Sub controlEmployee_SelectedIndexChanged(sender As Object, e As EventArgs) Handles controlEmployee.SelectedIndexChanged
        If controlEmployee.SelectedIndex > -1 Then
            currentControlEmployee = controlEmployee.SelectedIndex
            Dim line As String = currentControlEmployee
            Dim result() As String
            result = line.Split(" ")
            currentControlEmployee = result(0)
        End If
    End Sub

    Private Sub loadcontrol()

        CMD = New SqlCommand
        CMD.Connection = CN

        CMD.Parameters.Clear()
        CMD.CommandText = "arcade.getEMployeeList"
        CMD.CommandType = CommandType.StoredProcedure
        CMD.Parameters.Clear()
        Dim RDR As SqlDataReader

        CN.Open()
        RDR = CMD.ExecuteReader

        While RDR.Read
            controlEmployee.Items.Add(RDR.Item("employee"))
        End While
        RDR.Close()


        CMD = New SqlCommand
        CMD.Connection = CN

        CMD.Parameters.Clear()
        CMD.CommandText = "arcade.getClientList"
        CMD.CommandType = CommandType.StoredProcedure
        CMD.Parameters.Clear()

        RDR = CMD.ExecuteReader

        While RDR.Read



            topUpWho.Items.Add(RDR.Item("client"))
        End While
        RDR.Close()
        CN.Close()
    End Sub
End Class

