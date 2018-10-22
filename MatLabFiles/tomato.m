classdef tomato < handle
    properties
        Z = [];
        string = [];
        arrayData = [];
        serialOrder = [5,10,15; 4,9,14; 3,8,13; 2,7,12; 1,6,11];
        %N is the number of the real world position
        %Tomato is shaped [0,1,2;
        %                  3,4,5;
        %                  6,7,8;
        %                  9,10,11;
        %                  12,13,14]
        %String is shaped [4,9,14;
        %                  3,8,13;
        %                  2,7,12;
        %                  1,6,11;
        %                  0,5,10]
    end
    methods
        function order(obj)
            %Reorder the data so that the order specified in serialOrder
            for(i = 1:1:5)
                for(l = 1:1:3)
                    n = obj.serialOrder(i,l);
                    obj.Z(i,l) = obj.arrayData(n);   
                end
            end
        end
        function prep(obj)
            obj.arrayData = str2num(obj.string)
            if length(obj.arrayData) == 20
                obj.order
                %obj.Z = reshape(obj.arrayData, [4,5]);
                %obj.Z = obj.Z(:,any(obj.Z));
            else
                fprintf('Serial Issue \n')
            end
        end

        function cleanup(obj)
            clear obj.Z
            clear obj.string
            clear obj.arrayData
        end
    end
end
