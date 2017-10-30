@isTest class AUB_FluentIterableTest {
    @isTest static void testPassthru() {
        List<Object> toFilter = new List<Object> {1,2,3,4};
        List<Integer> filtered = (List<Integer>) AUB_FluentIterable.fromList(
            toFilter
        ).intoList(
            new List<Integer>()
        );
        System.assertEquals(4, filtered.size());
        System.assertEquals(1, filtered[0]);
        System.assertEquals(2, filtered[1]);
        System.assertEquals(3, filtered[2]);
        System.assertEquals(4, filtered[3]);
    }

    @isTest static void testFilter() {
        List<Object> toFilter = new List<Object> {1,2,3,4};
        List<Integer> filtered = (List<Integer>) AUB_FluentIterable.fromList(
            toFilter
        ).filter(
            new EvenPredicate()
        ).intoList(
            new List<Integer>()
        );
        System.assertEquals(2, filtered.size());
        System.assertEquals(2, filtered[0]);
        System.assertEquals(4, filtered[1]);
    }

    @isTest static void testTransformAndFilter() {
        List<Object> toFilter = new List<Object> {'1','2','3','4'};
        List<Integer> filtered = (List<Integer>) AUB_FluentIterable.fromList(
            toFilter
        ).transform(
            new ToInteger()
        ).filter(
            new EvenPredicate()
        ).intoList(
            new List<Integer>()
        );
        System.assertEquals(2, filtered.size());
        System.assertEquals(2, filtered[0]);
        System.assertEquals(4, filtered[1]);
    }

    @isTest static void testFilterTransformFilter() {
        List<String> toFilter = new List<String> {'1','two','2','3','4'};
        List<Integer> filtered = (List<Integer>) AUB_FluentIterable.fromList(
            toFilter
        ).filter(
            new IsNumeric()
        ).transform(
            new ToInteger()
        ).filter(
            new EvenPredicate()
        ).intoList(
            new List<Integer>()
        );
        System.assertEquals(2, filtered.size());
        System.assertEquals(2, filtered[0]);
        System.assertEquals(4, filtered[1]);
    }

    class ToInteger implements AUB_FluentIterable.Function {
        public Object apply(Object o) {
            return Integer.valueOf((String) o);
        }
    }

    class EvenPredicate implements AUB_FluentIterable.Predicate {
        public Boolean apply(Object o) {
            return Math.mod((Integer) o, 2) == 0;
        }
    }

    class IsNumeric implements AUB_FluentIterable.Predicate {
        private Pattern numericPattern = Pattern.compile('^\\d+$');
        public Boolean apply(Object o) {
            return numericPattern.matcher((String) o).matches();
        }
    }
}
