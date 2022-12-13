//

import 'package:flutter/material.dart';
import 'package:rest_list/helpers/localization/language_constants.dart';
import 'package:rest_list/helpers/styling/assets.dart';

class HomeMenuPage extends StatelessWidget {
  const HomeMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                Translator.translation(context).menu,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {},
                icon: Image.asset(Assets.edit),
              ),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: _leftSection(context),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: _details(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _leftSection(BuildContext context) {
    return Column(
      children: [
        _mainCategories(context),
        Expanded(
          child: Card(
            color: Colors.white,
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Meals',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  _subCategories(context),
                  _products(context),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _details(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(height: 52),
        Expanded(
          flex: 2,
          child: _detailsAddNewImage(), // _detailsAddNewImage(),
        ),
        Expanded(
          flex: 3,
          child: _scrollView(context),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.white,
          ),
          child: const Text(
            'Edit',
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Container _detailsAddNewImage() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: FractionallySizedBox(
          widthFactor: 0.33,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffEFEFEF),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white, // Color(0xffEFEFEF),
                size: 34,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _scrollView(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              Flexible(
                child: SizedBox(
                  height: double.maxFinite,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text('Dish name*',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: Theme.of(context).textTheme.bodySmall),
                          ),
                          Switch(
                            value: true,
                            onChanged: (_) {},
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              style: Theme.of(context).textTheme.bodyMedium,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'Enter dish name',
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Colors.grey.shade400,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text('Description**',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: Theme.of(context).textTheme.bodySmall),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              style: Theme.of(context).textTheme.bodyMedium,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'Enter dish name',
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Colors.grey.shade400,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _products(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          padding: const EdgeInsets.only(),
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: 9,
          itemBuilder: (context, index) {
            if (index == 0) {
              return _addNewDish(context);
            } else {
              return _dish(context);
            }
          }),
    );
  }

  Widget _subCategories(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Row(
        children: [
          _addButton(context),
          const SizedBox(width: 8),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(),
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const Center(
                      child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('Hello'),
                  ));
                }),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(Assets.coloredLeftArrow),
          ),
          const SizedBox(width: 4),
          IconButton(
            onPressed: () {},
            icon: Image.asset(Assets.coloredRightArrow),
          ),
        ],
      ),
    );
  }

  Widget _mainCategories(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: Row(
              children: [
                _addButton(context),
                const SizedBox(width: 8),
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.only(),
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const Center(
                            child: Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text('Hello'),
                        ));
                      }),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(Assets.arrowLeft),
                ),
                const SizedBox(width: 4),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(Assets.arrowRight),
                ),
                _sreachTextField(context)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dish(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _dishBG(),
            ),
            const SizedBox(height: 8),
            Text(
              'Dish name',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              '1,500 IQD',
              style: Theme.of(context).textTheme.caption?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dishBG() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6.0),
      child: Image.asset(Assets.dish),
    );
  }

  Widget _addNewDish(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _addNewDishBG(),
            ),
            const SizedBox(height: 8),
            Text(
              'Add new dish',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              'Fill details',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }

  Widget _addNewDishBG() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffEFEFEF),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: FractionallySizedBox(
          widthFactor: 0.33,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                color: Color(0xffEFEFEF),
                size: 34,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _sreachTextField(BuildContext context) {
    return Container(
      width: 210,
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(9)),
      alignment: Alignment.center,
      child: Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(Assets.search),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: TextField(
              style: Theme.of(context).textTheme.bodySmall,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(),
                hintText: 'Search',
                // filled: true,
                // fillColor: Colors.pink,
                isCollapsed: true,
                hintStyle: Theme.of(context).textTheme.bodySmall,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector _addButton(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.4),
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Icon(
          Icons.add,
          color: Theme.of(context).primaryColor, // Color(0xFFE7A968),E7A968
          size: 16,
        ),
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Column(
        children: [
          const SizedBox(height: 52),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      Assets.dish,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              'Italian salad',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Switch(
                            value: false,
                            onChanged: (_) {},
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              'Medium size',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                          ),
                          Text(
                            '1,500 IQD',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Theme.of(context).primaryColor,
                                    ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Flexible(
                        child: SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero.',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(height: 1.3),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 10,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          'Edit',
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
