ESX                   = nil
local PlayerData      = {}
local base64MoneyIcon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAQAAAAEACAYAAABccqhmAAAACXBIWXMAAAsTAAALEwEAmpwYAAAGT2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS42LWMxNDIgNzkuMTYwOTI0LCAyMDE3LzA3LzEzLTAxOjA2OjM5ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgMjAxOCAoV2luZG93cykiIHhtcDpDcmVhdGVEYXRlPSIyMDE4LTA2LTE3VDA0OjEzOjM4KzAyOjAwIiB4bXA6TW9kaWZ5RGF0ZT0iMjAxOC0wNi0xN1QwNDoxOToyNSswMjowMCIgeG1wOk1ldGFkYXRhRGF0ZT0iMjAxOC0wNi0xN1QwNDoxOToyNSswMjowMCIgZGM6Zm9ybWF0PSJpbWFnZS9wbmciIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MjNiOGI5NWYtODYwMS1jNjQxLTkwOGQtOGU4MGIzMDQ2ZmI0IiB4bXBNTTpEb2N1bWVudElEPSJhZG9iZTpkb2NpZDpwaG90b3Nob3A6OTA4OWZiYTktODRmNi03MDQ1LTgzNmUtMjE0OTc3YTc3ZTlhIiB4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ9InhtcC5kaWQ6MDQwNjU5NjgtNDNiNC1hODRjLWJlZjktYzI2ZmM2NzZmM2Y5Ij4gPHBob3Rvc2hvcDpUZXh0TGF5ZXJzPiA8cmRmOkJhZz4gPHJkZjpsaSBwaG90b3Nob3A6TGF5ZXJOYW1lPSIkIiBwaG90b3Nob3A6TGF5ZXJUZXh0PSIkIi8+IDwvcmRmOkJhZz4gPC9waG90b3Nob3A6VGV4dExheWVycz4gPHhtcE1NOkhpc3Rvcnk+IDxyZGY6U2VxPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0iY3JlYXRlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDowNDA2NTk2OC00M2I0LWE4NGMtYmVmOS1jMjZmYzY3NmYzZjkiIHN0RXZ0OndoZW49IjIwMTgtMDYtMTdUMDQ6MTM6MzgrMDI6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE4IChXaW5kb3dzKSIvPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6MjNiOGI5NWYtODYwMS1jNjQxLTkwOGQtOGU4MGIzMDQ2ZmI0IiBzdEV2dDp3aGVuPSIyMDE4LTA2LTE3VDA0OjE5OjI1KzAyOjAwIiBzdEV2dDpzb2Z0d2FyZUFnZW50PSJBZG9iZSBQaG90b3Nob3AgQ0MgMjAxOCAoV2luZG93cykiIHN0RXZ0OmNoYW5nZWQ9Ii8iLz4gPC9yZGY6U2VxPiA8L3htcE1NOkhpc3Rvcnk+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Hqf1JwAALTNJREFUeJztnXecU1Xe/9+Z3oeOCDiAAgNIGbCxMgjKD1EQwQXh0UUE3VUfG+vady3Y0OdRQRHXXcW2FhQLCizI2gCxPTAMdYYiMgxlYHpLT+7vjxi4SW4mPfcmOe/Xy9eLe3NvcszkfO73fNvRSZKEIGYp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'

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

function EnableSocietyMoneyHUDElement()

  local societyMoneyHUDElementTpl = '<div><img src="' .. base64MoneyIcon .. '" style="width:20px; height:20px; vertical-align:middle;">&nbsp;{{money}}</div>'

  ESX.UI.HUD.RegisterElement('society_money', 3, 0, societyMoneyHUDElementTpl, {
    money = 0
  })

end

function DisableSocietyMoneyHUDElement()
  ESX.UI.HUD.RemoveElement('society_money')
end

function UpdateSocietyMoneyHUDElement(money)

  ESX.UI.HUD.UpdateElement('society_money', {
    money = money
  })

end

function OpenBossMenu(society, close, options)

  local options  = options or {}
  local elements = {}

  local defaultOptions = {
    withdraw  = true,
    deposit   = true,
    wash      = true,
    employees = true,
    grades    = true
  }

  for k,v in pairs(defaultOptions) do
    if options[k] == nil then
      options[k] = v
    end
  end

  if options.withdraw then
    table.insert(elements, {label = _U('withdraw_society_money'), value = 'withdraw_society_money'})
  end

  if options.deposit then
    table.insert(elements, {label = _U('deposit_society_money'), value = 'deposit_money'})
  end

  if options.wash then
    table.insert(elements, {label = _U('wash_money'), value = 'wash_money'})
  end

  if options.employees then
    table.insert(elements, {label = _U('employee_management'), value = 'manage_employees'})
  end

  if options.grades then
    table.insert(elements, {label = _U('salary_management'), value = 'manage_grades'})
  end

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'boss_actions_' .. society,
    {
      css = 'patron',
      title    = 'Patron',
      elements = elements
    },
    function(data, menu)

      if data.current.value == 'withdraw_society_money' then

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'withdraw_society_money_amount_' .. society,
          {
            title = _U('withdraw_amount')
          },
          function(data, menu)

            local amount = tonumber(data.value)

            if amount == nil then
              ESX.ShowNotification(_U('invalid_amount'))
            else
              menu.close()
              TriggerServerEvent('esx_society:withdrawMoney', society, amount)
            end

          end,
          function(data, menu)
            menu.close()
          end
        )

      end

      if data.current.value == 'deposit_money' then

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'deposit_money_amount_' .. society,
          {
            title = _U('deposit_amount')
          },
          function(data, menu)

            local amount = tonumber(data.value)

            if amount == nil then
              ESX.ShowNotification(_U('invalid_amount'))
            else
              menu.close()
              TriggerServerEvent('esx_society:depositMoney', society, amount)
            end

          end,
          function(data, menu)
            menu.close()
          end
        )

      end

      if data.current.value == 'wash_money' then

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'wash_money_amount_' .. society,
          {
            title = _U('wash_money_amount')
          },
          function(data, menu)

            local amount = tonumber(data.value)

            if amount == nil then
              ESX.ShowNotification(_U('invalid_amount'))
            else
              menu.close()
              TriggerServerEvent('esx_society:washMoney', society, amount)
            end

          end,
          function(data, menu)
            menu.close()
          end
        )

      end

      if data.current.value == 'manage_employees' then
        OpenManageEmployeesMenu(society)
      end

      if data.current.value == 'manage_grades' then
        OpenManageGradesMenu(society)
      end

    end,
    function(data, menu)

      if close then
        close(data, menu)
      end

    end
  )

end

function OpenManageEmployeesMenu(society)

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'manage_employees_' .. society,
    {
      css = 'gestionpatron',
      title    = _U('employee_management'),
      elements = {
        {label = _U('employee_list'), value = 'employee_list'},
        {label = _U('recruit'),       value = 'recruit'},
      }
    },
    function(data, menu)

      if data.current.value == 'employee_list' then
        OpenEmployeeList(society)
      end

      if data.current.value == 'recruit' then
        OpenRecruitMenu(society)
      end

    end,
    function(data, menu)
      menu.close()
    end
  )

end

function OpenEmployeeList(society)

  ESX.TriggerServerCallback('esx_society:getEmployees', function(employees)

    local elements = {
      head = {_U('employee'), _U('grade'), _U('actions')},
      rows = {}
    }

    for i=1, #employees, 1 do

      local gradeLabel = (employees[i].job.grade_label == '' and employees[i].job.label or employees[i].job.grade_label)

      table.insert(elements.rows, {
        data = employees[i],
        cols = {
          employees[i].name,
          gradeLabel,
          '{{' .. _U('promote') .. '|promote}} {{' .. _U('fire') .. '|fire}}'
        }
      })
    end

    ESX.UI.Menu.Open(
      'list', GetCurrentResourceName(), 'employee_list_' .. society,
      elements,
      function(data, menu)

        local employee = data.data

        if data.value == 'promote' then
          menu.close()
          OpenPromoteMenu(society, employee)
        end

        if data.value == 'fire' then

          TriggerEvent('esx:showNotification', _U('you_have_fired', employee.name))

          ESX.TriggerServerCallback('esx_society:setJob', function()
            OpenEmployeeList(society)
          end, employee.identifier, 'unemployed', 0, 'fire')

        end

      end,
      function(data, menu)
        menu.close()
        OpenManageEmployeesMenu(society)
      end
    )

  end, society)

end

function OpenRecruitMenu(society)

  ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)

    local elements = {}

    for i=1, #players, 1 do
      if players[i].job.name ~= society then
        table.insert(elements, {label = players[i].name, value = players[i].source, name = players[i].name, identifier = players[i].identifier})
      end
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'recruit_' .. society,
      {
        css = 'gestionpatron',
        title    = _U('recruiting'),
        elements = elements
      },
      function(data, menu)

        ESX.UI.Menu.Open(
          'default', GetCurrentResourceName(), 'recruit_confirm_' .. society,
          {
            css = 'valider',
            title    = _U('do_you_want_to_recruit', data.current.name),
            elements = {
              {label = _U('yes'), value = 'yes'},
              {label = _U('no'),  value = 'no'},
            }
          },
          function(data2, menu2)

            menu2.close()

            if data2.current.value == 'yes' then

              TriggerEvent('esx:showNotification', _U('you_have_hired', data.current.name))

              ESX.TriggerServerCallback('esx_society:setJob', function()
                OpenRecruitMenu(society)
              end, data.current.identifier, society, 0, 'hire')

            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenPromoteMenu(society, employee)

  ESX.TriggerServerCallback('esx_society:getJob', function(job)

    local elements = {}

    for i=1, #job.grades, 1 do
      local gradeLabel = (job.grades[i].label == '' and job.label or job.grades[i].label)
      table.insert(elements, {label = gradeLabel, value = job.grades[i].grade, selected = (employee.job.grade == job.grades[i].grade)})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'promote_employee_' .. society,
      {
        css = 'gestionpatron',
        title    = _U('promote_employee', employee.name),
        elements = elements
      },
      function(data, menu)
        menu.close()

        TriggerEvent('esx:showNotification', _U('you_have_promoted', employee.name, data.current.label))

        ESX.TriggerServerCallback('esx_society:setJob', function()
          OpenEmployeeList(society)
        end, employee.identifier, society, data.current.value, 'promote')

      end,
      function(data, menu)
        menu.close()
        OpenEmployeeList(society)
      end
    )

  end, society)

end

function OpenManageGradesMenu(society)

  ESX.TriggerServerCallback('esx_society:getJob', function(job)

    local elements = {}

    for i=1, #job.grades, 1 do
      local gradeLabel = (job.grades[i].label == '' and job.label or job.grades[i].label)
      table.insert(elements, {label = gradeLabel .. ' $' .. job.grades[i].salary, value = job.grades[i].grade})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'manage_grades_' .. society,
      {
        css = 'gestionpatron',
        title    = _U('salary_management'),
        elements = elements
      },
      function(data, menu)

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'manage_grades_amount_' .. society,
          {
            title = _U('salary_amount')
          },
          function(data2, menu2)

            local amount = tonumber(data2.value)

            if amount == nil then
              ESX.ShowNotification(_U('invalid_amount'))
            elseif amount >= Config.MaxSalary then
              ESX.ShowNotification(_U('invalid_amount_max'))
            else
              menu2.close()

              ESX.TriggerServerCallback('esx_society:setJobSalary', function()
                OpenManageGradesMenu(society)
              end, society, data.current.value, amount)
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end, society)

end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  
  PlayerData = xPlayer

  DisableSocietyMoneyHUDElement()

  if PlayerData.job.grade_name == 'boss' then
    
    EnableSocietyMoneyHUDElement()
  
    ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
      UpdateSocietyMoneyHUDElement(money)
    end, PlayerData.job.name)

  end

end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)

  PlayerData.job = job

  DisableSocietyMoneyHUDElement()

  if PlayerData.job.grade_name == 'boss' then
    
    EnableSocietyMoneyHUDElement()
  
    ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
      UpdateSocietyMoneyHUDElement(money)
    end, PlayerData.job.name)

  end

end)

RegisterNetEvent('esx_addonaccount:setMoney')
AddEventHandler('esx_addonaccount:setMoney', function(society, money)

  if PlayerData.job ~= nil and PlayerData.job.grade_name == 'boss' and 'society_' .. PlayerData.job.name == society then
    UpdateSocietyMoneyHUDElement(money)
  end

end)

AddEventHandler('esx_society:openBossMenu', function(society, close, options)
  OpenBossMenu(society, close, options)
end)
