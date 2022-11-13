<template>
  <div class="">
    <h1>ScandiWeb Task <span class="smaller">By Mustafa Madkour</span></h1>
  </div>
  <div class="container">
    <div class="col-lg-12">
      <button class="float-end btn btn-success" @click="addModalDialog(true)">
        <FIcons :icon="['fas', 'cart-plus']" /> Add New Prpduct
      </button>
      <button
        class="float btn btn-danger"
        v-if="productData.length > 0"
        @click="deleteProducts()"
      >
        <FIcons :icon="['fas', 'trash-alt']" /> Delete Products
      </button>
      <div class="clearfix"></div>
      <hr class="bg-info" />
      <h3 class="text-center">List of Products ({{ productData.length }})</h3>
      <div class="card-group">
        <div class="row row-cols-1 row-cols-md-3 g4">
          <div class="col" v-for="(product, i) in productData" :key="i">
            <div class="card border-dark text-dark" style="width: 18rem">
              <div class="card-header">
                <div class="form-check">
                  <input
                    type="checkbox"
                    class="form-check-input"
                    :value="product.id"
                    id="checks"
                    v-model="selected"
                  />
                  <label for="checks" class="form-check-label">
                    <small class="text-muted"> Delete this product </small>
                  </label>
                </div>
              </div>
              <div class="card-body">
                <div class="row">
                  <div class="col-sm-1">
                    <FIcons :icon="['fas', 'id-badge']" />
                  </div>
                  <div class="col">
                    <p class="card-title text-muted">
                      Name: {{ product.name }}
                    </p>
                  </div>
                </div>
                <div class="row">
                  <div class="col-sm-1">
                    <FIcons :icon="['fas', 'tag']" />
                  </div>
                  <div class="col">
                    <p class="card-title text-muted">SKU: {{ product.sku }}</p>
                  </div>
                </div>
                <div class="row">
                  <div class="col-sm-1">
                    <FIcons :icon="['fas', 'usd']" />
                  </div>
                  <div class="col">
                    <p class="card-title text-muted">
                      Price: {{ product.price }}
                    </p>
                  </div>
                </div>
                <div class="row">
                  <div class="col-sm-1">
                    <FIcons :icon="['fas', 'info']" />
                  </div>
                  <div class="col-md">
                    <p class="card-title text-muted">
                      Type: {{ product.type }}
                    </p>
                  </div>
                </div>
              </div>
              <div class="card-footer">
                <small class="text-muted"
                  >Last updated at {{ product.created_at }}</small
                >
              </div>
            </div>
          </div>
        </div>
      </div>
      <div id="overlay" v-if="showAddModal">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="container">
              <div class="modal-header">
                <h2 class="modal-title text-white">Add New Product</h2>
                <button
                  class="btn btn-outline-danger"
                  aria-hidden="true"
                  @click="addModalDialog(false), defaultSelector()"
                >
                  <FIcons :icon="['fas', 'times']" />
                </button>
              </div>
              <div class="modal-body p-4">
                <form
                  action="#"
                  method="post"
                  style="pointer-events: all"
                  @click.prevent
                >
                  <div
                    class="form-floating mb-3"
                    :class="{ 'is-invalid': v$.newProduct.name.$error }"
                  >
                    <input
                      type="text"
                      name="name"
                      class="form-control"
                      id="productName"
                      placeholder="Product Name"
                      v-model="newProduct.name"
                    />
                    <label for="productName">
                      <FIcons :icon="['fas', 'edit']" /> Product Name:
                    </label>
                    <span
                      class="error-feedback"
                      v-if="v$.newProduct.name.$error"
                    >
                      {{ v$.newProduct.name.$errors[0].$message }}
                    </span>
                  </div>
                  <div
                    class="form-floating mb-3"
                    :class="{ 'is-invalid': v$.newProduct.sku.$error }"
                  >
                    <input
                      type="text"
                      name="sku"
                      class="form-control"
                      id="productSku"
                      placeholder="Product SKU"
                      v-model="newProduct.sku"
                    />
                    <label for="productSku">
                      <FIcons :icon="['fas', 'tag']" /> SKU:
                    </label>
                    <span
                      class="error-feedback"
                      v-if="v$.newProduct.sku.$error"
                    >
                      {{ v$.newProduct.sku.$errors[0].$message }}
                    </span>
                  </div>
                  <div
                    class="form-floating mb-3"
                    :class="{ 'is-invalid': v$.newProduct.price.$error }"
                  >
                    <input
                      type="text"
                      name="price"
                      class="form-control"
                      id="productPrice"
                      placeholder="Product Price"
                      v-model="newProduct.price"
                    />
                    <label for="productPrice">
                      <FIcons :icon="['fas', 'usd']" /> Price:
                    </label>
                    <span
                      class="error-feedback"
                      v-if="v$.newProduct.price.$error"
                    >
                      {{ v$.newProduct.price.$errors[0].$message }}
                    </span>
                  </div>
                  <div class="form-floating mb-3">
                    <textarea
                      type="text"
                      name="description"
                      class="form-control"
                      id="productDesc"
                      placeholder="Product Description"
                      v-model="newProduct.description"
                    ></textarea>
                    <label for="productDesc">
                      <FIcons :icon="['fas', 'info-circle']" /> Description:
                    </label>
                  </div>
                  <div
                    class="form-floating"
                    :class="{ 'is-invalid': v$.newProduct.type.$error }"
                  >
                    <select
                      name="type"
                      class="form-select mb-3"
                      id="floatingSelect"
                      aria-label="Floating label select type"
                      v-model="newProduct.type"
                    >
                      <option selected disabled>Select product type</option>
                      <option
                        value="dvd"
                        name="dvd"
                        :value="DVD"
                        @click="sizeModalDialog()"
                      >
                        DVD
                      </option>
                      <option
                        value="book"
                        name="book"
                        :value="book"
                        @click="weightModalDialog()"
                      >
                        Book
                      </option>
                      <option
                        value="furniture"
                        name="furniture"
                        :value="furniture"
                        @click="dimensionModalDialog()"
                      >
                        Furniture
                      </option>
                    </select>
                    <label for="floatingSelect">
                      <FIcons :icon="['fas', 'question-circle']" />
                      Type Switcher
                    </label>
                    <span
                      class="error-feedback"
                      v-if="v$.newProduct.type.$error"
                    >
                      {{ v$.newProduct.type.$errors[0].$message }}
                    </span>
                  </div>
                  <div
                    class="form-floating mb-3"
                    v-if="showSizeModal"
                    :class="{ 'is-invalid': v$.newProduct.size.$error }"
                  >
                    <input
                      type="text"
                      name="size"
                      class="form-control"
                      id="productSize"
                      placeholder="Product Size"
                      v-model="newProduct.size"
                    />
                    <label for="productSize">
                      <FIcons :icon="['fas', 'bullseye']" /> Size:
                    </label>
                    <span
                      class="error-feedback"
                      v-if="v$.newProduct.size.$error"
                    >
                      {{ v$.newProduct.size.$errors[0].$message }}
                    </span>
                  </div>
                  <div
                    class="form-floating mb-3"
                    v-if="showWeightModal"
                    :class="{ 'is-invalid': v$.newProduct.weight.$error }"
                  >
                    <input
                      type="text"
                      name="weight"
                      class="form-control"
                      id="productWeight"
                      placeholder="Product Weight"
                      v-model="newProduct.weight"
                    />
                    <label for="productWeight">
                      <FIcons :icon="['fas', 'weight']" /> Weight:
                    </label>
                    <span
                      class="error-feedback"
                      v-if="v$.newProduct.weight.$error"
                    >
                      {{ v$.newProduct.weight.$errors[0].$message }}
                    </span>
                  </div>
                  <div class="row g-2" v-if="showDimensionModal">
                    <span class="text-white"
                      ><FIcons :icon="['fas', 'pencil-ruler']" />
                      Dimensions</span
                    >
                    <div class="col-md">
                      <div
                        class="form-floating"
                        :class="{ 'is-invalid': v$.newProduct.width.$error }"
                      >
                        <input
                          type="number"
                          name="width"
                          class="form-control"
                          id="productWidth"
                          placeholder="Product Width"
                          v-model="newProduct.width"
                        />
                        <label for="productWidth">Width:</label>
                        <span
                          class="error-feedback"
                          v-if="v$.newProduct.width.$error"
                        >
                          {{ v$.newProduct.width.$errors[0].$message }}
                        </span>
                      </div>
                    </div>
                    <div class="col-md">
                      <div
                        class="form-floating"
                        :class="{ 'is-invalid': v$.newProduct.height.$error }"
                      >
                        <input
                          type="number"
                          name="height"
                          class="form-control"
                          id="productHeight"
                          placeholder="Product Height"
                          v-model="newProduct.height"
                        />
                        <label for="productHeight">Height:</label>
                        <span
                          class="error-feedback"
                          v-if="v$.newProduct.height.$error"
                        >
                          {{ v$.newProduct.height.$errors[0].$message }}
                        </span>
                      </div>
                    </div>
                    <div class="col-md">
                      <div
                        class="form-floating"
                        :class="{ 'is-invalid': v$.newProduct.length.$error }"
                      >
                        <input
                          type="number"
                          name="length"
                          class="form-control"
                          id="productLength"
                          placeholder="Product Length"
                          v-model="newProduct.length"
                        />
                        <label for="productLength">Length:</label>
                        <span
                          class="error-feedback"
                          v-if="v$.newProduct.length.$error"
                        >
                          {{ v$.newProduct.length.$errors[0].$message }}
                        </span>
                      </div>
                    </div>
                  </div>
                  <hr class="bg-warning" />
                  <div class="d-grid gap-2">
                    <button class="btn btn-primary" @click="addNewProduct()">
                      Add New Product
                    </button>
                    <button
                      class="btn btn-danger"
                      @click="addModalDialog(false), defaultSelector()"
                    >
                      Cancel
                    </button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import axios from 'axios';
import useValidate from '@vuelidate/core';
import { required, decimal } from '@vuelidate/validators';
export default {
  name: 'AddProduct',
  data() {
    return {
      v$: useValidate(),
      productData: [],
      showSizeModal: false,
      showWeightModal: false,
      showDimensionModal: false,
      showAddModal: false,
      newProduct: {
        name: '',
        sku: '',
        price: '',
        description: '',
        type: '',
        size: 0,
        weight: 0,
        width: 0,
        height: 0,
        length: 0,
      },
      deleted: [],
      selected: [],
    };
  },
  validations() {
    return {
      newProduct: {
        name: { required },
        sku: { required },
        price: { required, decimal },
        type: { required },
        size: { required },
        weight: { required },
        width: { required },
        height: { required },
        length: { required },
      },
    };
  },
  mounted() {
    this.getProductsData();
    this.addNewProduct();
    this.deleteProducts();
  },
  methods: {
    addModalDialog(val) {
      this.showAddModal = val;
    },
    sizeModalDialog() {
      this.showSizeModal = true;
      this.showWeightModal = false;
      this.showDimensionModal = false;
    },
    weightModalDialog() {
      this.showSizeModal = false;
      this.showWeightModal = true;
      this.showDimensionModal = false;
    },
    dimensionModalDialog() {
      this.showSizeModal = false;
      this.showWeightModal = false;
      this.showDimensionModal = true;
    },
    defaultSelector() {
      this.showSizeModal = false;
      this.showWeightModal = false;
      this.showDimensionModal = false;
    },
    async getProductsData() {
      let res = await axios.get('http://localhost:8000/products');
      const resData = res.data;
      if (res.status == 200) {
        if (resData.errors) {
          this.errMsg = resData.message;
        } else {
          this.productData = resData.products;
        }
      }
    },
    toFormData(obj) {
      var fd = new FormData();
      for (var i in obj) {
        fd.append(i, obj[i]);
      }
      return fd;
    },
    async addNewProduct() {
      this.v$.newProduct.$validate();
      if (!this.v$.newProduct.$error) {
        console.log('Add new product: Validated successfully');
        this.addModalDialog(false);
        // var formData = this.toFormData(this.newProduct);
        let res = await axios.post(
          `http://localhost:8000/products`,
          this.newProduct
        );
        const resData = res.data;
        if (res.status == 200) {
          if (resData.error) {
            this.errMsg = resData.message;
          } else {
            this.newProduct = {
              name: '',
              sku: '',
              price: '',
              description: '',
              type: '',
              size: '',
              weight: '',
              width: '',
              length: '',
              height: '',
            };
            this.getProductsData();
            this.v$.newProduct.$reset();
          }
        }
      } else {
        console.log('Add new product: Not Validated');
      }
      this.getProductsData();
      this.v$.newProduct.$reset();
    },
    async deleteProducts() {
      let res = await axios.delete('http://localhost:8000/products', {
        headers: {},
        data: this.selected,
      });
      const resData = res.data;
      if (res.status == 200) {
        if (resData.errors) {
          this.errMsg = resData.message;
        } else {
          this.deleted = resData.message;
          this.selected = [];
          this.getProductsData();
        }
      }
    },
  },
};
</script>
<style scoped>
h1 {
  background-color: rgb(235, 108, 50);
  color: white;
  padding: 8px;
  margin-top: 0;
  margin-bottom: 50px;
}

.smaller {
  font-size: 0.85rem;
}

#overlay {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background-color: rgba(31, 29, 28, 0.9);
}
.is-invalid {
  color: red;
}

.is-invalid input {
  border-color: red;
}
</style>
