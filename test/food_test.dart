import 'package:test/test.dart';
import 'package:titan/sensazonal/gateways/food_gateway.dart';

void main() {
  group("food list query tests", () {
    group("should return an empty list when ", () {
      test("json is null", () {
        const jsonString = null;

        var foods = parseFoodsQuery(jsonString);

        expect(foods, []);
      });

      test("json is an empty string", () {
        const jsonString = "";

        var foods = parseFoodsQuery(jsonString);

        expect(foods, []);
      });

      test("json is an empty object", () {
        const jsonString = "{}";

        var foods = parseFoodsQuery(jsonString);

        expect(foods, []);
      });

      test("json data is null", () {
        const jsonString = '{"data": null}';

        var foods = parseFoodsQuery(jsonString);

        expect(foods, []);
      });

      test("json data is an empty object", () {
        const jsonString = '{"data": {}}';

        var foods = parseFoodsQuery(jsonString);

        expect(foods, []);
      });

      test("json data.foods is null", () {
        const jsonString = '{"data": {"foods": null}}';

        var foods = parseFoodsQuery(jsonString);

        expect(foods, []);
      });

      test("json data.foods is an empty list", () {
        const jsonString = '{"data":{"foods":[]}}';

        var foods = parseFoodsQuery(jsonString);

        expect(foods, []);
      });
    });

    test("should parse a food list json", () {
      const jsonString = '{"data":{"foods":[{"name":"Pineapple","months":[1,3,9,10,11,12],"imageUrl":"https://raw.githubusercontent.com/ronanrodrigo/Sensazonal/master/Sensazonal/System/Assets.xcassets/Content/PINEAPPLE.imageset/PINEAPPLE%403x.jpg","id":"1","group":"Fruit"},{"name":"Star Fruit","months":[1,2,6,7,8],"imageUrl":"https://raw.githubusercontent.com/ronanrodrigo/Sensazonal/master/Sensazonal/System/Assets.xcassets/Content/PINEAPPLE.imageset/PINEAPPLE%403x.jpg","id":"1","group":"Fruit"},{"name":"Green Coconut","months":[1,2,3,10,11,12],"imageUrl":"https://raw.githubusercontent.com/ronanrodrigo/Sensazonal/master/Sensazonal/System/Assets.xcassets/Content/PINEAPPLE.imageset/PINEAPPLE%403x.jpg","id":"1","group":"Fruit"},{"name":"Fig","months":[1,2,3,12],"imageUrl":"https://raw.githubusercontent.com/ronanrodrigo/Sensazonal/master/Sensazonal/System/Assets.xcassets/Content/PINEAPPLE.imageset/PINEAPPLE%403x.jpg","id":"1","group":"Fruit"},{"name":"Raspberry","months":[1,11,12],"imageUrl":"https://raw.githubusercontent.com/ronanrodrigo/Sensazonal/master/Sensazonal/System/Assets.xcassets/Content/PINEAPPLE.imageset/PINEAPPLE%403x.jpg","id":"1","group":"Fruit"}]}}';

      var foods = parseFoodsQuery(jsonString);

      expect(foods.length, 5);
      expect(foods.elementAt(1).id, "1");
      expect(foods.elementAt(1).name, "Star Fruit");
      expect(foods.elementAt(1).group, "Fruit");
      expect(foods.elementAt(1).months, [1, 2, 6, 7, 8]);
      expect(foods.elementAt(1).imageUrl, "https://raw.githubusercontent.com/ronanrodrigo/Sensazonal/master/Sensazonal/System/Assets.xcassets/Content/PINEAPPLE.imageset/PINEAPPLE%403x.jpg");
    });
  });
}
