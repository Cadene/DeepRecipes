local ArtistStyleCriterion, parent = torch.class(
    'nn.ArtistStyleCriterion',
    'nn.Criterion'
)

function ArtistStyleCriterion:__init()
    parent.__init(self)
end

function ArtistStyleCriterion:updateOutput(activ_origin, activ_gener)
    local nDimension = activ_origin:nDimension()
    local size = activ_origin:size()
    if nDimension ~= activ_gener:nDimension() then
        error('activ origin et gener different')
    end
    local product = 1
    for i = 1, nDimension do
        if size[i] ~= activ_gener:size(i) then
            error('activ origin et gener different')
        end
        product = product * size[i]
    end
    activ_origin = activ_origin:reshape(product)
    activ_gener  = activ_gener:reshape(product)

    local loss = 0
    for i = 1, product do
        local tmp = activ_origin[i] - activ_gener[i]
        loss = loss + tmp * tmp
    end
    loss = loss / 2

    return loss
end

function ArtistStyleCriterion:updateGradInput(activ_origin, activ_gener)  
    local gradInput = torch.FloatTensor():resizeAs(activ_origin)
    for i = 1, activ_origin:size(1) do
        for j = 1, activ_origin:size(2) do
            for k = 1, activ_origin:size(3) do
                if activ_gener[{i,j,k}] > 0 then
                    gradInput[{i,j,k}] = activ_gener[{i,j,k}] - activ_origin[{i,j,k}]
                else
                    gradInput[{i,j,k}] = 0
                end
            end
        end
    end
    return gradInput
end
