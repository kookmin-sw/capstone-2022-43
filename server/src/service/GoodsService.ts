import Goods from "../domain/Goods";
import goodsRepository from "../repository/GoodsRepository";

class GoodsService {
    public async saveGoods(goods: Goods): Promise<Goods> {
        const created_goods = await goodsRepository.save(goods);

        return created_goods;

    }
}

export default GoodsService;