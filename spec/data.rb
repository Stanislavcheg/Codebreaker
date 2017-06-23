module Codebreaker
  module Data
    def self.algorithm_data
      [
        ['1234', '1234', '++++'], ['1234', '4321', '----'], ['1234', '4343', '--'],
        ['1231', '1234', '+++'],  ['1134', '1431', '++--'], ['1234', '4213', '+---'],
        ['1324', '1234', '++--'], ['1111', '1321', '++'], ['1234', '2431', '+---'],
        ['1234', '1111', '+'], ['2552', '1221', '--'], ['1234', '2314', '+---'],
        ['1234', '2332', '+-'], ['4441', '2233', ''], ['2112', '1222', '+--'],
        ['1234', '5561', '-'], ['1234', '1342', '+---'], ['1234', '1423', '+---'],
        ['3211', '1561', '+-'], ['1666', '6661', '++--'], ['1234', '5231', '++-'],
        ['1134', '1155', '++'], ['1134', '5115', '+-'], ['1134', '5511', '--'],
        ['1134', '1115', '++'], ['1134', '5111', '+-'], ['1234', '1555', '+'],
        ['1234', '2555', '-'], ['1234', '5224', '++'], ['1234', '5154', '+-'],
        ['1234', '2545', '--'], ['1234', '5234', '+++'], ['1234', '5134', '++-'],
        ['1234', '5124', '+--'], ['1234', '5115', '-'], ['1234', '6134', '++-'],
        ['5143', '4153', '++--'], ['5523', '5155', '+-'], ['1234', '1524', '++-'],
        ['6235', '2365', '+---'], ['1234', '1235', '+++'], ['1234', '1245', '++-'],
        ['1234', '6254', '++'], ['1234', '5635', '+'], ['1234', '4326', '---'],
        ['1234', '3525', '--'], ['1234', '2552', '-'], ['1234', '4255', '+-'],
        ['1234', '1524', '++-'], ['1234', '5431', '+--'], ['1234', '6666', ''],
        ['1115', '1231', '+-'], ['1231', '1111', '++'], ['1234', '1243', '++--'],
        ['1111', '1111', '++++'], ['1111', '1115', '+++'], ['1111', '1155', '++'],
        ['1111', '1555', '+'], ['1111', '5555', ''], ['1221', '2112', '----'],
        ['1221', '2114', '---'], ['1221', '2155', '--'], ['1221', '2555', '-'],
        ['2245', '2254', '++--'], ['2245', '2253', '++-'], ['2245', '2435', '++-'],
        ['2245', '2533', '+-'], ['3331', '3332', '+++'], ['1234', '1324', '++--'],
        ['1113', '1112', '+++'], ['1312', '1212', '+++'], ['1234', '1266', '++'],
        ['1234', '6634', '++'], ['1234', '1654', '++'], ['1234', '1555', '+'],
        ['5432', '2345', '----'], ['1234', '2143', '----'], ['1243', '1234', '++--'],
        ['1221', '2112', '----'], ['5432', '2541', '---'], ['1145', '6514', '---'],
        ['1244', '4156', '--'], ['1221', '2332', '--'], ['2244', '4526', '--'],
        ['5556', '1115', '-'], ['1234', '6653', '-'], ['3331', '1253', '--'],
        ['2345', '4542', '+--'], ['1243', '1234', '++--'], ['4111', '4444', '+'],
        ['1532', '5132', '++--'], ['3444', '4334', '+--'], ['1113', '2155', '+'],
        ['2245', '4125', '+--'], ['4611', '1466', '---'], ['5451', '4445', '+-'],
        ['6541', '6541', '++++'], ['1234', '5612', '--'], ['5566', '5600', '+-'],
        ['1234', '1235', '+++'], ['1234', '6634', '++'], ['1234', '1654', '++'],
        ['1234', '6254', '++'], ['1234', '5635', '+'], ['1234', '4326', '---'],
        ['1234', '3525', '--'], ['1234', '2552', '-'], ['1234', '4255', '+-'],
        ['1234', '1524', '++-'], ['1234', '5431', '+--'], ['1234', '6666', ''],
        ['1115', '1231', '+-'], ['1221', '2112', '----'], ['1231', '1111', '++'],
        ['4444', '4444', '++++'], ['3331', '3332', '+++'], ['1532', '5132', '++--'],
        ['1113', '1112', '+++'], ['1234', '1266', '++'], ['1234', '6634', '++'],
        ['1234', '1654', '++'], ['1234', '1555', '+'], ['1234', '4321', '----'],
        ['5432', '2345', '----'], ['1234', '2143', '----'], ['1221', '2112', '----'],
        ['5432', '2541', '---'], ['1145', '6514', '---'], ['1244', '4156', '--'],
        ['1221', '2332', '--'], ['2244', '4526', '--'], ['5556', '1115', '-'],
        ['1234', '6653', '-'], ['3331', '1253', '--'], ['1243', '1234', '++--'],
        ['4111', '4444', '+'], ['1532', '5132', '++--'], ['3444', '4334', '+--'],
        ['1113', '2155', '+'], ['2245', '4125', '+--'], ['4611', '1466', '---'],
        ['3331', '3332', '+++'], ['1113', '1112', '+++'], ['1312', '1212', '+++'],
        ['1234', '1235', '+++'], ['1234', '1266', '++'], ['1122', '1325', '++'],
        ['2345', '4542', '+--'], ['3444', '4334', '+--'], ['2245', '4125', '+--'],
        ['5451', '4445', '+-'], ['1234', '5212', '+-'], ['1234', '1112', '+-'],
        ['1122', '1233', '+-'], ['4111', '4444', '+'], ['1113', '2155', '+'],
        ['5556', '1115', '-'], ['1234', '6653', '-'], ['1234', '5551', '-'],
        ['1234', '5511', '-'], ['1244', '4156', '--'], ['1221', '2332', '--'],
        ['3331', '1253', '--'], ['2244', '4526', '--'], ['5432', '2541', '---'],
        ['1145', '6514', '---'],['4611', '1466', '---'],
        ['1234', '6423', '---'], ['5432', '2345', '----'], ['1234', '2143', '----'],
        ['1221', '2112', '----'], ['1234', '5555', ''],
        ['1234', '5656', ''], ['1234', '6655', ''], ['1234', '5665', ''],
        ['1111', '2222', ''], ['1211', '3333', ''], ['1121', '3333', ''],
        ['1112', '3333', ''], ['1112', '4444', ''], ['1212', '3456', ''],
        ['3334', '3331', '+++'], ['3433', '3133', '+++'], ['3343', '3313', '+++'],
        ['4333', '1333', '+++'], ['4332', '1332', '+++'], ['4323', '1323', '+++'],
        ['4233', '1233', '+++'], ['2345', '2346', '+++'], ['2534', '2634', '+++'],
        ['2354', '2364', '+++'], ['1234', '5123', '---'], ['3612', '1523', '---'],
        ['3612', '2531', '---'], ['1234', '5612', '--'], ['1234', '5621', '--'],
        ['4321', '1234', '----'], ['3421', '1234', '----'], ['3412', '1234', '----'],
        ['4312', '1234', '----'], ['1423', '1234', '+---'], ['1342', '1234', '+---'],
        ['5255', '2555', '++--'], ['5525', '2555', '++--'], ['5552', '2555', '++--'],
        ['6262', '2626', '----'], ['6622', '2626', '++--'], ['2266', '2626', '++--'],
        ['2662', '2626', '++--'], ['6226', '2626', '++--'], ['3135', '3315', '++--'],
        ['3513', '3315', '++--'], ['3351', '3315', '++--'], ['1353', '3315', '+---'],
        ['5313', '3315', '++--'], ['1533', '3315', '----'], ['5331', '3315', '+---'],
        ['5133', '3315', '----'], ['3361', '3315', '++-'], ['3136', '3635', '++-'],
        ['1336', '6334', '++-'], ['1363', '6323', '++-'], ['1633', '6233', '++-']
    ]
    end
  end
end
