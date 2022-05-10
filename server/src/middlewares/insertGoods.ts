import { supabase } from "../utils/supabase";


const insertGoods = async (requestId: number, goodsRequest: any) => {
    goodsRequest.request_id = requestId;
    const { data: goods, error: FailToGoods }  = await supabase.from('GOODS').insert(goodsRequest).single();
    if (FailToGoods) {
        return FailToGoods;
    }
    return goods;
};

export default insertGoods;