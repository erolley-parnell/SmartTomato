classdef tomato < handle
    properties
        Z = [];
        string = [];
        arrayData;
    end
    methods
        function prep(obj)
            obj.arrayData = str2num(obj.string);
            numel(obj.arrayData);
            if length(obj.arrayData) == 20
                obj.Z = reshape(obj.arrayData, [4,5]);
                obj.Z = obj.Z(:,any(obj.Z));
            else
                fprintf('Serial Issue')
            end
        end
        function cleanup(obj)
            clear obj.Z
            clear obj.string
            clear obj.arrayData
        end
    end
end